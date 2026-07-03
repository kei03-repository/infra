variable "alarm_name" {
  type = string
}

variable "alarm_description" {
  type    = string
  default = null
}

variable "comparison_operator" {
  type = string
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

variable "namespace" {
  type = string
}

variable "metric_name" {
  type = string
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

variable "tags" {
  type    = map(string)
  default = {}
}