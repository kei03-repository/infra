variable "product_name" {
  description = "Input variable: product_name."
  type        = string
}

variable "environment" {
  description = "Input variable: environment."
  type        = string
}

variable "vpc_id" {
  description = "Input variable: vpc_id."
  type        = string
}

variable "subnet_type" {
  description = "Input variable: subnet_type."
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Input variable: map_public_ip_on_launch."
  type        = bool
  default     = false
}

variable "subnets" {
  description = "Input variable: subnets."
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}
