variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "service_name" {
  description = "Input variable: service_name."
  type        = string
}

variable "cluster_arn" {
  description = "Input variable: cluster_arn."
  type        = string
}

variable "task_definition_arn" {
  description = "Input variable: task_definition_arn."
  type        = string
}

variable "subnet_ids" {
  description = "Input variable: subnet_ids."
  type        = list(string)
}

variable "security_group_id" {
  description = "Input variable: security_group_id."
  type        = string
}

variable "target_group_arn" {
  description = "Input variable: target_group_arn."
  type        = string
}

variable "container_name" {
  description = "Input variable: container_name."
  type        = string
}

variable "container_port" {
  description = "Input variable: container_port."
  type        = number
  default     = 8080
}

variable "desired_count" {
  description = "Input variable: desired_count."
  type        = number
  default     = 0
}

variable "assign_public_ip" {
  description = "Input variable: assign_public_ip."
  type        = bool
  default     = false
}
