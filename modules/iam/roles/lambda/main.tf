data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    sid = "AllowLogsWrite"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = var.log_group_arns
  }

  dynamic "statement" {
    for_each = var.enable_vpc_access ? [1] : []

    content {
      sid = "AllowVpcNetworkInterface"

      actions = [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
      ]

      resources = ["*"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = coalesce(var.role_name, "${var.environment}--${var.product_name}--lambda-role")
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {
    Name        = coalesce(var.role_name, "${var.environment}--${var.product_name}--lambda-role")
    ProductName = var.product_name
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "${aws_iam_role.this.name}-plc"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.inline_policy.json
}
