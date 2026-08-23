output "role_arn" {
  description = "ARN of the IAM role."
  value       = aws_iam_role.manager_role.arn
}

output "role_id" {
  description = "ID of the IAM role."
  value       = aws_iam_role.manager_role.id
}

output "role_name" {
  description = "Name of the IAM role."
  value       = aws_iam_role.manager_role.name
}

output "policy_arn" {
  description = "ARN of the IAM policy."
  value       = aws_iam_policy.manager_policy.arn
}

output "assume_role_command" {
  description = "AWS CLI command for assuming the manager role."
  value       = "aws sts assume-role --role-arn ${aws_iam_role.manager_role.arn} --role-session-name manager-session"
}
