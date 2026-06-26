variable "name_prefix" { type = string }
variable "cluster_id" { type = string }
variable "execution_role_arn" { type = string }
variable "task_role_arn" { type = string }
variable "subnet_ids" { type = list(string) }
variable "security_group_id" { type = string }
variable "target_group_arn" { type = string }
variable "container_name" { type = string }
variable "container_image" { type = string }
variable "container_port" {
  type    = number
  default = 8080
}
variable "cpu" {
  type    = number
  default = 256
}
variable "memory" {
  type    = number
  default = 512
}
variable "desired_count" {
  type    = number
  default = 1
}
variable "log_group_name" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}
