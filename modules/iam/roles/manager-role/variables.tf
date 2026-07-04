variable "role_name" {
  description = "IAM ロール名"
  type        = string
  default     = "manager-role"
}

variable "assume_role_account_id" {
  description = "スイッチロール元のアカウント ID"
  type        = string
}

variable "tags" {
  description = "リソースに付与するタグ"
  type        = map(string)
  default     = {}
}
