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
  statement {
    sid = "AllowLogsWrite"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = var.log_group_arns
  }

  statement {
    sid = "AllowEcrAuthorization"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }

  statement {
    sid = "AllowEcrImagePull"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer"
    ]

    resources = var.ecr_repository_arns
  }
}

resource "aws_iam_role" "this" {
  name               = coalesce(var.role_name, "${var.environment}--${var.product_name}--ecs-task-exec-role")
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {
    Name        = coalesce(var.role_name, "${var.environment}--${var.product_name}--ecs-task-exec-role")
    ProductName = var.product_name
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "${aws_iam_role.this.name}-plc"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.inline_policy.json
}
