variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "role_name" {
  description = "Input variable: role_name."
  type        = string
  default     = null
}

variable "log_group_arns" {
  description = "Input variable: log_group_arns."
  type        = list(string)
  default     = ["*"]
}

variable "enable_vpc_access" {
  description = "Input variable: enable_vpc_access."
  type        = bool
  default     = false
}
