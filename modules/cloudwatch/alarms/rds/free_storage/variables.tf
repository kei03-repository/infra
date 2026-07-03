variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "db_instance_identifier" {
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
  default = "AWS/RDS"
}

variable "metric_name" {
  type    = string
  default = "FreeStorageSpace"
}

variable "comparison_operator" {
  type    = string
  default = "LessThanThreshold"
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
  default = 1
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