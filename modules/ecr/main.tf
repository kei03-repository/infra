resource "aws_ecr_repository" "this" {
  name         = var.name
  force_delete = var.force_delete
  image_scanning_configuration { scan_on_push = true }
  tags = var.tags
}
