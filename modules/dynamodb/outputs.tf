output "table_name" {
  description = "Output value: table_name."
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "Output value: table_arn."
  value       = aws_dynamodb_table.this.arn
}

output "table_id" {
  description = "Output value: table_id."
  value       = aws_dynamodb_table.this.id
}

output "dynamodb_table_name" {
  description = "Output value: dynamodb_table_name."
  value       = aws_dynamodb_table.this.name
}

output "dynamodb_table_arn" {
  description = "Output value: dynamodb_table_arn."
  value       = aws_dynamodb_table.this.arn
}

output "dynamodb_table_id" {
  description = "Output value: dynamodb_table_id."
  value       = aws_dynamodb_table.this.id
}
