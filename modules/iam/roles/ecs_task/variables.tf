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

variable "dynamodb_table_arns" {
  description = "Input variable: dynamodb_table_arns."
  type        = list(string)
  default     = []
}

variable "s3_bucket_arns" {
  description = "Input variable: s3_bucket_arns."
  type        = list(string)
  default     = []
}

variable "s3_object_arns" {
  description = "Input variable: s3_object_arns."
  type        = list(string)
  default     = []
}

variable "kms_key_arns" {
  description = "Input variable: kms_key_arns."
  type        = list(string)
  default     = []
}
