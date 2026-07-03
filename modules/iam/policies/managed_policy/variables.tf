variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "policy_name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "path" {
  type    = string
  default = "/"
}

variable "policy_json" {
  type = string
}
