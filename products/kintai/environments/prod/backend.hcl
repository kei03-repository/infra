bucket         = "kintai-terraform-state-prod"
key            = "products/kintai/prod/terraform.tfstate"
region         = "ap-northeast-1"
dynamodb_table = "kintai-terraform-lock-prod"
encrypt        = true
