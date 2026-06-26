variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "app_port" {
  type    = number
  default = 8080
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "artifact_bucket_name" {
  type = string
}
