variable "name_prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}

variable "target_port" {
  type    = number
  default = 8080
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "tags" {
  type    = map(string)
  default = {}
}
