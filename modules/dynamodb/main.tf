resource "aws_dynamodb_table" "this" {
  name         = "${var.environment}--${var.product_name}--dydb"
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  range_key    = var.range_key

  dynamic "attribute" {
    for_each = var.attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = {
    Name        = "${var.environment}--${var.product_name}--dydb"
    ProductName = var.product_name
  }
}