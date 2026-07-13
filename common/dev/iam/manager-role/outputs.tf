output "manager_role_arn" {
  description = "Manager Role ARN"
  value       = module.manager_role.role_arn
}

output "manager_role_name" {
  description = "Manager Role 名"
  value       = module.manager_role.role_name
}

output "manager_role_id" {
  description = "Manager Role ID"
  value       = module.manager_role.role_id
}

output "manager_policy_arn" {
  description = "Manager Role のポリシー ARN"
  value       = module.manager_role.policy_arn
}

output "assume_role_command" {
  description = "スイッチロール用の AWS CLI コマンド例"
  value       = "aws sts assume-role --role-arn ${module.manager_role.role_arn} --role-session-name manager-session"
}

output "switch_role_url" {
  description = "AWS Console でのスイッチロール URL（テンプレート）"
  value       = "https://signin.aws.amazon.com/switchrole?account=${data.aws_caller_identity.current.account_id}&roleName=${module.manager_role.role_name}"
}
