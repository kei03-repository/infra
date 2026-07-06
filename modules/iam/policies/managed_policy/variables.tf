variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "policy_name" {
  description = "Input variable: policy_name."
  type        = string
  default     = null
}

variable "description" {
  description = "Input variable: description."
  type        = string
  default     = null
}

variable "path" {
  description = "Input variable: path."
  type        = string
  default     = "/"
}

variable "policy_json" {
  description = "Input variable: policy_json."
  type        = string
}
