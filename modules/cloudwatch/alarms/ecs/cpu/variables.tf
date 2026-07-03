variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "alarm_name" {
  type    = string
  default = null
}

variable "alarm_description" {
  type    = string
  default = null
}

variable "namespace" {
  type    = string
  default = "AWS/ECS"
}

variable "metric_name" {
  type    = string
  default = "CPUUtilization"
}

variable "comparison_operator" {
  type    = string
  default = "GreaterThanThreshold"
}

variable "threshold" {
  type = number
}

variable "period" {
  type    = number
  default = 60
}

variable "evaluation_periods" {
  type    = number
  default = 2
}

variable "datapoints_to_alarm" {
  type    = number
  default = null
}

variable "statistic" {
  type    = string
  default = "Average"
}

variable "unit" {
  type    = string
  default = null
}

variable "dimensions" {
  type    = map(string)
  default = {}
}

variable "treat_missing_data" {
  type    = string
  default = "missing"
}

variable "actions_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}