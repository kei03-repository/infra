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

variable "target_arns" {
  type = list(string)
}

variable "target_actions" {
  type = list(string)

  default = [
    "lambda:InvokeFunction",
    "sns:Publish",
    "sqs:SendMessage"
  ]
}
