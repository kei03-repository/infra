variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "hash_key" {
  description = "Input variable: hash_key."
  type        = string
}

variable "range_key" {
  description = "Input variable: range_key."
  type        = string
  default     = null
}

variable "billing_mode" {
  description = "Input variable: billing_mode."
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "attributes" {
  description = "Input variable: attributes."
  type = list(object({
    name = string
    type = string
  }))
}
