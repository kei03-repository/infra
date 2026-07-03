data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    sid = "AllowInvokeTarget"

    actions   = var.target_actions
    resources = var.target_arns
  }
}

resource "aws_iam_role" "this" {
  name               = coalesce(var.role_name, "${var.environment}--${var.product_name}--events-role")
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {
    Name        = coalesce(var.role_name, "${var.environment}--${var.product_name}--events-role")
    ProductName = var.product_name
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "${aws_iam_role.this.name}-plc"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.inline_policy.json
}
