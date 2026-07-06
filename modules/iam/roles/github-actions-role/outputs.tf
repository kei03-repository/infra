output "role_arn" {
  description = "GitHub Actions Role ARN"
  value       = aws_iam_role.github_actions_role.arn
}

output "role_id" {
  description = "GitHub Actions Role ID"
  value       = aws_iam_role.github_actions_role.id
}

output "role_name" {
  description = "GitHub Actions Role 名"
  value       = aws_iam_role.github_actions_role.name
}

output "policy_arn" {
  description = "Terraform 実行ポリシー ARN"
  value       = aws_iam_policy.terraform_execution_policy.arn
}
