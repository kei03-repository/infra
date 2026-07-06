variable "alarm_name" {
  description = "Input variable: alarm_name."
  type        = string
}

variable "alarm_description" {
  description = "Input variable: alarm_description."
  type        = string
  default     = null
}

variable "comparison_operator" {
  description = "Input variable: comparison_operator."
  type        = string
  default     = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  description = "Input variable: evaluation_periods."
  type        = number
}

variable "datapoints_to_alarm" {
  description = "Input variable: datapoints_to_alarm."
  type        = number
  default     = null
}

variable "threshold" {
  description = "Input variable: threshold."
  type        = number
}

variable "period" {
  description = "Input variable: period."
  type        = number
}

variable "statistic" {
  description = "Input variable: statistic."
  type        = string
  default     = "Sum"
}

variable "treat_missing_data" {
  description = "Input variable: treat_missing_data."
  type        = string
  default     = "notBreaching"
}

variable "actions_enabled" {
  description = "Input variable: actions_enabled."
  type        = bool
  default     = true
}

variable "alarm_actions" {
  description = "Input variable: alarm_actions."
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  description = "Input variable: ok_actions."
  type        = list(string)
  default     = []
}

variable "insufficient_data_actions" {
  description = "Input variable: insufficient_data_actions."
  type        = list(string)
  default     = []
}

variable "log_group_name" {
  description = "Input variable: log_group_name."
  type        = string
}

variable "filter_name" {
  description = "Input variable: filter_name."
  type        = string
}

variable "filter_pattern" {
  description = "Input variable: filter_pattern."
  type        = string
}

variable "metric_namespace" {
  description = "Input variable: metric_namespace."
  type        = string
}

variable "metric_name" {
  description = "Input variable: metric_name."
  type        = string
}

variable "metric_value" {
  description = "Input variable: metric_value."
  type        = string
}

variable "metric_default_value" {
  description = "Input variable: metric_default_value."
  type        = number
  default     = null
}

variable "dimensions" {
  description = "Input variable: dimensions."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Input variable: tags."
  type        = map(string)
  default     = {}
}
