# Terraform State の設定
# S3 バックエンドを使用する場合は以下のコメントを解除してください
# 
# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-state-bucket"
#     key            = "dev/iam/manager-role/terraform.tfstate"
#     region         = "ap-northeast-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock"
#   }
# }

# ローカルバックエンドを使用する場合は以下の設定で十分です
# 本番環境では S3 バックエンドの使用を推奨します
