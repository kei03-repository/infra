#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-auto}"
ENV_NAME="${2:-dev}"
TARGET_INPUT="${3:-}"

ensure_commit_exists() {
  local ref="$1"

  if git cat-file -e "${ref}^{commit}" 2>/dev/null; then
    return 0
  fi

  # Try to fetch only the missing commit first; fall back to a broader fetch.
  git fetch --no-tags --depth=200 origin "$ref" >/dev/null 2>&1 || \
    git fetch --no-tags origin >/dev/null 2>&1 || true

  git cat-file -e "${ref}^{commit}" 2>/dev/null
}

find_root_with_main_tf() {
  local path="$1"
  local dir
  dir="$(dirname "$path")"

  while [[ "$dir" != "." && "$dir" != "/" ]]; do
    if [[ -f "$dir/main.tf" ]]; then
      echo "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done

  return 1
}

allowed_prefix_for_env() {
  local env_name="$1"
  if [[ "$env_name" == "dev" ]]; then
    echo "common/environments/dev/ products/kintai/modules/"
  else
    echo "products/kintai/modules/"
  fi
}

is_allowed_target() {
  local env_name="$1"
  local target="$2"
  local prefixes
  prefixes="$(allowed_prefix_for_env "$env_name")"

  for prefix in $prefixes; do
    if [[ "$target" == "$prefix"* ]]; then
      return 0
    fi
  done

  return 1
}

declare -A TARGET_SET=()

if [[ "$MODE" == "manual" ]]; then
  while IFS= read -r raw; do
    path="$(echo "$raw" | xargs)"
    [[ -z "$path" ]] && continue

    if [[ ! -f "$path/main.tf" ]]; then
      echo "Skipping $path: main.tf not found" >&2
      continue
    fi

    if is_allowed_target "$ENV_NAME" "$path"; then
      TARGET_SET["$path"]=1
    else
      echo "Skipping $path: not allowed for environment $ENV_NAME" >&2
    fi
  done < <(echo "$TARGET_INPUT" | tr ',' '\n')
else
  BASE_REF="${BASE_REF:-}"
  HEAD_REF="${HEAD_REF:-}"

  if [[ -z "$BASE_REF" || -z "$HEAD_REF" ]]; then
    echo "BASE_REF and HEAD_REF are required in auto mode" >&2
    exit 1
  fi

  if ! ensure_commit_exists "$BASE_REF"; then
    echo "Unable to resolve BASE_REF commit: $BASE_REF" >&2
    exit 1
  fi

  if ! ensure_commit_exists "$HEAD_REF"; then
    echo "Unable to resolve HEAD_REF commit: $HEAD_REF" >&2
    exit 1
  fi

  CHANGED_FILES=$(git diff --name-only "$BASE_REF" "$HEAD_REF")

  while IFS= read -r file; do
    [[ -z "$file" ]] && continue

    if [[ "$file" == "modules/"* ]]; then
      for module_dir in products/kintai/modules/*; do
        if [[ -f "$module_dir/main.tf" ]]; then
          if is_allowed_target "$ENV_NAME" "$module_dir"; then
            TARGET_SET["$module_dir"]=1
          fi
        fi
      done

      if [[ "$ENV_NAME" == "dev" ]]; then
        for common_dir in common/environments/dev/iam/*; do
          if [[ -f "$common_dir/main.tf" ]]; then
            TARGET_SET["$common_dir"]=1
          fi
        done
      fi

      continue
    fi

    if root=$(find_root_with_main_tf "$file"); then
      if is_allowed_target "$ENV_NAME" "$root"; then
        TARGET_SET["$root"]=1
      fi
    fi
  done <<< "$CHANGED_FILES"
fi

if [[ ${#TARGET_SET[@]} -eq 0 ]]; then
  echo '{"include":[]}'
  exit 0
fi

mapfile -t SORTED_TARGETS < <(printf '%s\n' "${!TARGET_SET[@]}" | sort)

json='{"include":['
for target in "${SORTED_TARGETS[@]}"; do
  escaped_target=${target//"/\\"}
  json+="{\"path\":\"$escaped_target\"},"
done
json="${json%,}]}"

echo "$json"
