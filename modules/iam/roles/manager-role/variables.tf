variable "role_name" {
  description = "Name of the IAM role."
  type        = string
  default     = "manager-role"
}

variable "assume_role_account_id" {
  description = "AWS account ID allowed to assume this role."
  type        = string
}

variable "tags" {
  description = "Tags applied to created resources."
  type        = map(string)
  default     = {}
}
