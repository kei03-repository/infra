resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = {
    Name        = "${var.environment}--${var.product_name}--${var.subnet_type}--${each.key}--sn"
    ProductName = var.product_name
  }
}