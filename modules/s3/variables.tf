variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "bucket_name" {
  description = "Input variable: bucket_name."
  type        = string
}

variable "kms_key_arn" {
  description = "Input variable: kms_key_arn."
  type        = string
  default     = null
}

variable "versioning_enabled" {
  description = "Input variable: versioning_enabled."
  type        = bool
  default     = true
}
