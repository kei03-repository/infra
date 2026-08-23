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

output "events_role_id" {
  description = "Output value: events_role_id."
  value       = aws_iam_role.this.id
}

output "events_role_name" {
  description = "Output value: events_role_name."
  value       = aws_iam_role.this.name
}

output "events_role_arn" {
  description = "Output value: events_role_arn."
  value       = aws_iam_role.this.arn
}
