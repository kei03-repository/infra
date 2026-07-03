variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "hash_key" {
  type = string
}

variable "range_key" {
  type    = string
  default = null
}

variable "billing_mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}

variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
}