variable "role_name" {
  description = "GitHub Actions 用 IAM ロール名"
  type        = string
}

variable "github_organization" {
  description = "GitHub Organization または User 名"
  type        = string
}

variable "github_repositories" {
  description = "許可する GitHub リポジトリ名一覧（owner なし）"
  type        = list(string)
}

variable "oidc_provider_arn" {
  description = "GitHub OIDC Provider ARN"
  type        = string
}

variable "tags" {
  description = "リソースに付与するタグ"
  type        = map(string)
  default     = {}
}
