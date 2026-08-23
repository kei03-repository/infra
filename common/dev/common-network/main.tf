module "vpc" {
  source = "../../../modules/vpc"

  product_name         = var.project_name
  environment          = var.environment
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

module "public_subnet" {
  source = "../../../modules/subnet"

  product_name            = var.project_name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  subnet_type             = "public"
  map_public_ip_on_launch = true
  subnets                 = local.public_subnets
}

module "private_subnet" {
  source = "../../../modules/subnet"

  product_name            = var.project_name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  subnet_type             = "private"
  map_public_ip_on_launch = false
  subnets                 = local.private_subnets
}
