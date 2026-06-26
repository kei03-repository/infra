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
  source      = "../../modules/security_group"
  name_prefix = local.name_prefix
  vpc_id      = module.network.vpc_id
  app_port    = var.app_port
  tags        = local.common_tags
}

module "alb" {
  source            = "../../modules/alb"
  name_prefix       = local.name_prefix
  vpc_id            = module.network.vpc_id
  subnet_ids        = module.network.public_subnet_ids
  alb_sg_id         = module.security_group.alb_sg_id
  target_port       = var.app_port
  health_check_path = var.health_check_path
  tags              = local.common_tags
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
  source      = "../../modules/s3"
  bucket_name = var.artifact_bucket_name
  kms_key_arn = module.kms.kms_key_arn
  tags        = local.common_tags
}
