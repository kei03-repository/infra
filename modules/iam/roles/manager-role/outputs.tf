output "role_arn" {
  description = "IAM ロールの ARN"
  value       = aws_iam_role.manager_role.arn
}

output "role_id" {
  description = "IAM ロールの ID"
  value       = aws_iam_role.manager_role.id
}

output "role_name" {
  description = "IAM ロール名"
  value       = aws_iam_role.manager_role.name
}

output "policy_arn" {
  description = "IAM ポリシーの ARN"
  value       = aws_iam_policy.manager_policy.arn
}

output "assume_role_command" {
  description = "スイッチロール用の AWS CLI コマンド"
  value       = "aws sts assume-role --role-arn ${aws_iam_role.manager_role.arn} --role-session-name manager-session"
}
