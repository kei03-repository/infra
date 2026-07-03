variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "repository_name" {
  type = string
}

variable "force_delete" {
  type    = bool
  default = false
}

variable "scan_on_push" {
  type    = bool
  default = true
}
