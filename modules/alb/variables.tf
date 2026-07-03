variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "alb_security_group_id" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "deployment_color" {
  type = string

  validation {
    condition     = contains(["blue", "green"], var.deployment_color)
    error_message = "deployment_color must be blue or green."
  }
}

variable "target_port" {
  type    = number
  default = 8080
}

variable "health_check_path" {
  type    = string
  default = "/"
}
