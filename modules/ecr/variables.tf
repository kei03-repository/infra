variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "repository_name" {
  description = "Input variable: repository_name."
  type        = string
}

variable "force_delete" {
  description = "Input variable: force_delete."
  type        = bool
  default     = false
}

variable "scan_on_push" {
  description = "Input variable: scan_on_push."
  type        = bool
  default     = true
}
