# Dev 環境用の変数設定

aws_region   = "ap-northeast-1"
environment  = "dev"
project_name = "common"

# GitHub OIDC Provider ARN（事前作成済みの Provider を指定）
oidc_provider_arn = "arn:aws:iam::123456789012:oidc-provider/token.actions.githubusercontent.com"

# GitHub Organization / User 名
github_organization = "your-org"

# 許可するリポジトリ（owner なし）
github_repositories = [
  "infra",
]
