variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "cluster_name" {
  description = "Input variable: cluster_name."
  type        = string
}

variable "service_name" {
  description = "Input variable: service_name."
  type        = string
}

variable "alarm_name" {
  description = "Input variable: alarm_name."
  type        = string
  default     = null
}

variable "alarm_description" {
  description = "Input variable: alarm_description."
  type        = string
  default     = null
}

variable "namespace" {
  description = "Input variable: namespace."
  type        = string
  default     = "AWS/ECS"
}

variable "metric_name" {
  description = "Input variable: metric_name."
  type        = string
  default     = "MemoryUtilization"
}

variable "comparison_operator" {
  description = "Input variable: comparison_operator."
  type        = string
  default     = "GreaterThanThreshold"
}

variable "threshold" {
  description = "Input variable: threshold."
  type        = number
}

variable "period" {
  description = "Input variable: period."
  type        = number
  default     = 60
}

variable "evaluation_periods" {
  description = "Input variable: evaluation_periods."
  type        = number
  default     = 2
}

variable "datapoints_to_alarm" {
  description = "Input variable: datapoints_to_alarm."
  type        = number
  default     = null
}

variable "statistic" {
  description = "Input variable: statistic."
  type        = string
  default     = "Average"
}

variable "unit" {
  description = "Input variable: unit."
  type        = string
  default     = null
}

variable "dimensions" {
  description = "Input variable: dimensions."
  type        = map(string)
  default     = {}
}

variable "treat_missing_data" {
  description = "Input variable: treat_missing_data."
  type        = string
  default     = "missing"
}

variable "actions_enabled" {
  description = "Input variable: actions_enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Input variable: tags."
  type        = map(string)
  default     = {}
}
