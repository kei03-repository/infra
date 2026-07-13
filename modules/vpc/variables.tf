variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "cidr_block" {
  description = "Input variable: cidr_block."
  type        = string
}

variable "enable_dns_support" {
  description = "Input variable: enable_dns_support."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Input variable: enable_dns_hostnames."
  type        = bool
  default     = true
}
