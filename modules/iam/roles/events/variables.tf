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

variable "target_arns" {
  description = "Input variable: target_arns."
  type        = list(string)
}

variable "target_actions" {
  description = "Input variable: target_actions."
  type        = list(string)

  default = [
    "lambda:InvokeFunction",
    "sns:Publish",
    "sqs:SendMessage"
  ]
}
