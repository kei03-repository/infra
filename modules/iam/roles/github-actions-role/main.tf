data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = local.oidc_subjects
    }
  }
}

resource "aws_iam_role" "github_actions_role" {
  name               = local.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = merge(
    var.tags,
    {
      Name = local.role_name
    }
  )
}

data "aws_iam_policy_document" "terraform_execution_policy" {
  statement {
    sid       = "TerraformExecutionActions"
    effect    = "Allow"
    actions   = local.terraform_allowed_actions
    resources = ["*"]
  }
}

resource "aws_iam_policy" "terraform_execution_policy" {
  name        = "${local.role_name}-plcy"
  description = "Terraform execution policy for ${local.role_name}"
  policy      = data.aws_iam_policy_document.terraform_execution_policy.json

  tags = merge(
    var.tags,
    {
      Name = "${local.role_name}-plcy"
    }
  )
}

resource "aws_iam_role_policy_attachment" "terraform_execution_policy_attachment" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = aws_iam_policy.terraform_execution_policy.arn
}
