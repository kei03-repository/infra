variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "vpc_id" {
  description = "Input variable: vpc_id."
  type        = string
}

variable "subnet_ids" {
  description = "Input variable: subnet_ids."
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Input variable: alb_security_group_id."
  type        = string
}

variable "certificate_arn" {
  description = "Input variable: certificate_arn."
  type        = string
}

variable "deployment_color" {
  description = "Input variable: deployment_color."
  type        = string

  validation {
    condition     = contains(["blue", "green"], var.deployment_color)
    error_message = "deployment_color must be blue or green."
  }
}

variable "target_port" {
  description = "Input variable: target_port."
  type        = number
  default     = 8080
}

variable "health_check_path" {
  description = "Input variable: health_check_path."
  type        = string
  default     = "/"
}
