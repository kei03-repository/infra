variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "kms_key_arn" {
  type    = string
  default = null
}

variable "versioning_enabled" {
  type    = bool
  default = true
}
