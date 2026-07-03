variable "rule_name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "event_bus_name" {
  type    = string
  default = "default"
}

variable "event_pattern" {
  type = string
}

variable "is_enabled" {
  type    = bool
  default = true
}

variable "target_arn" {
  type = string
}

variable "target_role_arn" {
  type    = string
  default = null
}

variable "target_input" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}