data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  dynamic "statement" {
    for_each = length(var.dynamodb_table_arns) > 0 ? [1] : []

    content {
      sid = "AllowDynamoDbAccess"

      actions = [
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem",
        "dynamodb:DeleteItem",
        "dynamodb:Query",
        "dynamodb:Scan"
      ]

      resources = var.dynamodb_table_arns
    }
  }

  dynamic "statement" {
    for_each = length(var.s3_bucket_arns) > 0 ? [1] : []

    content {
      sid = "AllowS3ListBucket"

      actions = [
        "s3:ListBucket"
      ]

      resources = var.s3_bucket_arns
    }
  }

  dynamic "statement" {
    for_each = length(var.s3_object_arns) > 0 ? [1] : []

    content {
      sid = "AllowS3ObjectAccess"

      actions = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ]

      resources = var.s3_object_arns
    }
  }

  dynamic "statement" {
    for_each = length(var.kms_key_arns) > 0 ? [1] : []

    content {
      sid = "AllowKmsDecryptEncrypt"

      actions = [
        "kms:Decrypt",
        "kms:Encrypt",
        "kms:GenerateDataKey"
      ]

      resources = var.kms_key_arns
    }
  }
}

resource "aws_iam_role" "this" {
  name               = coalesce(var.role_name, "${var.environment}--${var.product_name}--ecs-task-role")
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {
    Name        = coalesce(var.role_name, "${var.environment}--${var.product_name}--ecs-task-role")
    ProductName = var.product_name
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "${aws_iam_role.this.name}-plc"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.inline_policy.json
}
