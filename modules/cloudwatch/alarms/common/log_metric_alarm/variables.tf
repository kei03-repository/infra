variable "alarm_name" {
  type = string
}

variable "alarm_description" {
  type    = string
  default = null
}

variable "comparison_operator" {
  type    = string
  default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  type = number
}

variable "datapoints_to_alarm" {
  type    = number
  default = null
}

variable "threshold" {
  type = number
}

variable "period" {
  type = number
}

variable "statistic" {
  type    = string
  default = "Sum"
}

variable "treat_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "actions_enabled" {
  type    = bool
  default = true
}

variable "alarm_actions" {
  type    = list(string)
  default = []
}

variable "ok_actions" {
  type    = list(string)
  default = []
}

variable "insufficient_data_actions" {
  type    = list(string)
  default = []
}

variable "log_group_name" {
  type = string
}

variable "filter_name" {
  type = string
}

variable "filter_pattern" {
  type = string
}

variable "metric_namespace" {
  type = string
}

variable "metric_name" {
  type = string
}

variable "metric_value" {
  type = string
}

variable "metric_default_value" {
  type    = number
  default = null
}

variable "dimensions" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}