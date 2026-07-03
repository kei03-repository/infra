resource "aws_ecr_repository" "this" {
  name         = "${var.product_name}-${var.repository_name}"
  force_delete = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Name        = "${var.product_name}-${var.repository_name}"
    ProductName = var.product_name
  }
}
