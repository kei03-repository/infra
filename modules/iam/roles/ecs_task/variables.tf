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

variable "dynamodb_table_arns" {
  type    = list(string)
  default = []
}

variable "s3_bucket_arns" {
  type    = list(string)
  default = []
}

variable "s3_object_arns" {
  type    = list(string)
  default = []
}

variable "kms_key_arns" {
  type    = list(string)
  default = []
}
