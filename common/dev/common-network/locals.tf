locals {
  common_tags = {
    Environment   = var.environment
    Project       = var.project_name
    Component     = "network"
    ManagedBy     = "Terraform"
    TerraformPath = "common/dev/common-network"
  }

  public_subnets = {
    a = {
      cidr_block        = var.public_subnet_cidr_block
      availability_zone = var.availability_zone
    }
  }

  private_subnets = {
    a = {
      cidr_block        = var.private_subnet_a_cidr_block
      availability_zone = var.availability_zone
    }
    b = {
      cidr_block        = var.private_subnet_b_cidr_block
      availability_zone = var.availability_zone
    }
  }
}
