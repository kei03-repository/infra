output "role_id" {
  description = "Output value: role_id."
  value       = aws_iam_role.this.id
}

output "role_name" {
  description = "Output value: role_name."
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "Output value: role_arn."
  value       = aws_iam_role.this.arn
}

output "lambda_role_id" {
  description = "Output value: lambda_role_id."
  value       = aws_iam_role.this.id
}

output "lambda_role_name" {
  description = "Output value: lambda_role_name."
  value       = aws_iam_role.this.name
}

output "lambda_role_arn" {
  description = "Output value: lambda_role_arn."
  value       = aws_iam_role.this.arn
}
