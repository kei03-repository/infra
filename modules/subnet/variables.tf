variable "product_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_type" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}

variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}