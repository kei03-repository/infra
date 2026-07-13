locals {
  role_name = var.role_name

  # Terraform 実行主体（GitHub Actions）に集約する権限
  terraform_allowed_actions = [
    "ec2:*",
    "rds:*",
    "elasticloadbalancing:*",
    "dynamodb:*",
    "lambda:*",
    "cloudwatch:*",
    "logs:*",
    "s3:*",
    "codecommit:*",
    "codebuild:*",
    "codedeploy:*",
    "codepipeline:*",
    "sns:*",
    "sqs:*",
    "apigateway:*",
    "cloudfront:*",
    "route53:*",
    "autoscaling:*",
    "application-autoscaling:*",
    "elasticache:*",
    "events:*",
    "iam:*",
    "kms:*",
    "cloudformation:*",
    "cloudtrail:*",
    "config:*",
    "secretsmanager:*",
    "ssm:*",
    "resourcegroupstaggingapi:*",
    "tag:*",
    "sts:GetCallerIdentity",
    "sts:AssumeRole",
  ]

  oidc_subjects = [for repo in var.github_repositories : "repo:${var.github_organization}/${repo}:*"]
}
