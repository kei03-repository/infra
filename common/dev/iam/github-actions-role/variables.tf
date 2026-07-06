variable "aws_region" {
  description = "AWS リージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "environment" {
  description = "環境名"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
  default     = "common"
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
