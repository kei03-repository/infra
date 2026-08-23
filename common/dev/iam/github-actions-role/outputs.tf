output "github_actions_role_arn" {
  description = "GitHub Actions Role ARN"
  value       = module.github_actions_role.role_arn
}

output "github_actions_role_name" {
  description = "GitHub Actions Role 名"
  value       = module.github_actions_role.role_name
}

output "github_actions_role_id" {
  description = "GitHub Actions Role ID"
  value       = module.github_actions_role.role_id
}

output "github_actions_policy_arn" {
  description = "GitHub Actions Role の Terraform 実行ポリシー ARN"
  value       = module.github_actions_role.policy_arn
}
