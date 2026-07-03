resource "aws_ecs_cluster" "this" {
  name = "${var.environment}--${var.product_name}--cl"
  tags = {
    Name        = "${var.environment}--${var.product_name}--cl"
    ProductName = var.product_name
  }
}
