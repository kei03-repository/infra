terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# IAM ロール作成
resource "aws_iam_role" "manager_role" {
  name               = local.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = merge(
    var.tags,
    {
      Name = local.role_name
    }
  )
}

# 信頼ポリシー（スイッチロール元のアカウントからの AssumeRole を許可）
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals = {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.assume_role_account_id}:root"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# 許可ポリシー
data "aws_iam_policy_document" "manager_policy" {
  statement {
    sid    = "TerraformAllowedActions"
    effect = "Allow"
    actions = concat(
      local.terraform_allowed_actions,
      [
        # 追加の許可アクション
        "resourcegroupstaggingapi:*",
        "ssm:GetParameter",
        "ssm:GetParameters",
        "ssm:GetParametersByPath",
        "ssm:DescribeParameters",
      ]
    )
    resources = ["*"]
  }

  statement {
    sid    = "DenyProhibitedActions"
    effect = "Deny"
    actions = local.denied_actions
    resources = ["*"]
  }

  statement {
    sid    = "DenyAssumeRole"
    effect = "Deny"
    actions = [
      "sts:AssumeRole",
      "sts:AssumeRoleWithSAML",
      "sts:AssumeRoleWithWebIdentity",
    ]
    resources = ["*"]
  }
}

# ポリシーの作成
resource "aws_iam_policy" "manager_policy" {
  name        = "${local.role_name}-plcy"
  description = "Policy for ${local.role_name}"
  policy      = data.aws_iam_policy_document.manager_policy.json

  tags = merge(
    var.tags,
    {
      Name = "${local.role_name}-plcy"
    }
  )
}

# ポリシーをロールにアタッチ
resource "aws_iam_role_policy_attachment" "manager_policy_attachment" {
  role       = aws_iam_role.manager_role.name
  policy_arn = aws_iam_policy.manager_policy.arn
}
