# Infra Repository

この `infra` はアプリ本体とは独立した、AWS インフラ定義用のリポジトリです。

現在は Terraform ベースで管理しています。

GitHub Actions は `infra` 配下ではなく、workspace 直下の `.github/workflows/` で app と合わせて一元管理します。

## 構成

```text
infra/
├─ environments/
│  ├─ dev/
│  │  ├─ main.tf
│  │  ├─ providers.tf
│  │  ├─ variables.tf
│  │  ├─ outputs.tf
│  │  └─ versions.tf
│  └─ prod/
│     ├─ main.tf
│     ├─ providers.tf
│     ├─ variables.tf
│     ├─ outputs.tf
│     └─ versions.tf
├─ modules/
│  ├─ acm/
│  ├─ alb/
│  ├─ cloudwatch/
│  ├─ ecr/
│  ├─ ecs_cluster/
│  ├─ iam/
│  ├─ kms/
│  ├─ network/
│  ├─ route53/
│  ├─ s3/
│  └─ security_group/
├─ products/
│  └─ kintai/
│     ├─ environments/
│     │  ├─ dev/
│     │  │  ├─ backend.hcl
│     │  │  └─ terraform.tfvars
│     │  └─ prod/
│     │     ├─ backend.hcl
│     │     └─ terraform.tfvars
│     └─ modules/
│        ├─ backend/
│        ├─ dynamodb/
│        ├─ ecs_service/
│        ├─ frontend/
│        ├─ lambda/
│        └─ rds/
├─ scripts/
├─ buildspec.yml
└─ CIDRブロック設計方針.md
```

## 役割

- `environments/`: 共通基盤の環境別エントリポイント（`dev` / `prod`）
- `modules/`: 共通で再利用する Terraform モジュール
- `products/kintai/modules/`: kintai 固有の Terraform モジュール
- `products/kintai/environments/`: kintai 固有の環境設定（state backend, tfvars）
- `scripts/`: Terraform 操作補助スクリプト置き場

## GitHub Actions との関係

- `.github/workflows/ci-gitaction.yml`: `App/kintai` と `infra` の変更をまとめて検知する CI
- `.github/workflows/sync-codecommit.yml`: workspace 全体を CodeCommit に mirror する同期

## 今後の増やし方

将来的にアプリを増やす場合は、`products/` 配下にアプリ単位で追加します。

例:

- `products/kintai/`
- `products/app-b/`
- `products/app-c/`

共通基盤は `environments/` + `modules/` に、アプリ固有の基盤は `products/<app-name>/` に寄せる方針です。