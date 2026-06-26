module "ecr" {
  source       = "../../../../modules/ecr"
  name         = "${replace(var.name_prefix, "_", "-")}-backend"
  force_delete = var.force_delete_ecr
  tags         = var.tags
}

output "repository_url" {
  value = module.ecr.repository_url
}
