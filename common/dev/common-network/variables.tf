variable "aws_region" {
  description = "AWS リージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "environment" {
  description = "環境名"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
  default     = "common"
}

variable "vpc_cidr_block" {
  description = "VPC の CIDR ブロック"
  type        = string
  default     = "10.20.0.0/20"
}

variable "availability_zone" {
  description = "Subnet を配置する Availability Zone"
  type        = string
  default     = "ap-northeast-1a"
}

variable "public_subnet_cidr_block" {
  description = "Public subnet の CIDR ブロック"
  type        = string
  default     = "10.20.0.0/24"
}

variable "private_subnet_a_cidr_block" {
  description = "Private subnet A の CIDR ブロック"
  type        = string
  default     = "10.20.4.0/24"
}

variable "private_subnet_b_cidr_block" {
  description = "Private subnet B の CIDR ブロック"
  type        = string
  default     = "10.20.5.0/24"
}
