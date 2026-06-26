variable "name_prefix" {
  type = string
}

variable "force_delete_ecr" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
