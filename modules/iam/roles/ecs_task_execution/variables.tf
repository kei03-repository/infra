variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "role_name" {
  type    = string
  default = null
}

variable "log_group_arns" {
  type    = list(string)
  default = ["*"]
}

variable "ecr_repository_arns" {
  type    = list(string)
  default = ["*"]
}
