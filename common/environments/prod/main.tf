locals {
  name_prefix = "${var.project_name}-${var.environment}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

module "network" {
  source               = "../../modules/network"
  name_prefix          = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.availability_zones
  tags                 = local.common_tags
}

module "security_group" {
  for_each = toset(["alb", "app", "db"])

  source              = "../../modules/security_group"
  product_name        = var.project_name
  environment         = var.environment
  vpc_id              = module.network.vpc_id
  security_group_name = each.key

  ingress_rules = each.key == "alb" ? [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ] : each.key == "app" ? [
    {
      from_port       = var.app_port
      to_port         = var.app_port
      protocol        = "tcp"
      security_groups = [module.security_group["alb"].security_group_id]
    }
  ] : [
    {
      from_port       = var.db_port
      to_port         = var.db_port
      protocol        = "tcp"
      security_groups = [module.security_group["app"].security_group_id]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "alb" {
  source                = "../../modules/alb"
  product_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.public_subnet_ids
  alb_security_group_id = module.security_group["alb"].security_group_id
  target_port           = var.app_port
  health_check_path     = var.health_check_path
}

module "ecs_cluster" {
  source = "../../modules/ecs_cluster"
  name   = "${local.name_prefix}-cluster"
  tags   = local.common_tags
}

module "ecr_backend" {
  source = "../../modules/ecr"
  name   = "${replace(local.name_prefix, "_", "-")}-backend"
  tags   = local.common_tags
}

module "ecr_frontend" {
  source = "../../modules/ecr"
  name   = "${replace(local.name_prefix, "_", "-")}-frontend"
  tags   = local.common_tags
}

module "kms" {
  source     = "../../modules/kms"
  alias_name = "${local.name_prefix}-infra"
  tags       = local.common_tags
}

module "artifact_bucket" {
  source       = "../../modules/s3"
  product_name = var.project_name
  environment  = var.environment
  bucket_name  = var.artifact_bucket_name
  kms_key_arn  = module.kms.kms_key_arn
}
