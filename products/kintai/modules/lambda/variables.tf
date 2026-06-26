variable "function_name" { type = string }
variable "filename" { type = string }
variable "handler" { type = string }
variable "runtime" { type = string }
variable "role_arn" { type = string }
variable "timeout" {
  type    = number
  default = 30
}
variable "memory_size" {
  type    = number
  default = 256
}
variable "environment_variables" {
  type    = map(string)
  default = {}
}
variable "tags" {
  type    = map(string)
  default = {}
}
