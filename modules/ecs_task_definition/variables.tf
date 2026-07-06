variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "task_definition_name" {
  description = "Input variable: task_definition_name."
  type        = string
}

variable "execution_role_arn" {
  description = "Input variable: execution_role_arn."
  type        = string
}

variable "task_role_arn" {
  description = "Input variable: task_role_arn."
  type        = string
}

variable "container_definitions" {
  description = "Input variable: container_definitions."
  type        = string
}

variable "cpu" {
  description = "Input variable: cpu."
  type        = number
  default     = 256
}

variable "memory" {
  description = "Input variable: memory."
  type        = number
  default     = 512
}

variable "network_mode" {
  description = "Input variable: network_mode."
  type        = string
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "Input variable: requires_compatibilities."
  type        = list(string)
  default     = ["FARGATE"]
}
