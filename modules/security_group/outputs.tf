output "alb_sg_id" {
  description = "Output value: alb_sg_id."
  value       = aws_security_group.this.id
}

output "app_sg_id" {
  description = "Output value: app_sg_id."
  value       = aws_security_group.this.id
}

output "db_sg_id" {
  description = "Output value: db_sg_id."
  value       = aws_security_group.this.id
}

output "alb_security_group_id" {
  description = "Output value: alb_security_group_id."
  value       = aws_security_group.this.id
}

output "app_security_group_id" {
  description = "Output value: app_security_group_id."
  value       = aws_security_group.this.id
}

output "db_security_group_id" {
  description = "Output value: db_security_group_id."
  value       = aws_security_group.this.id
}

output "security_group_id" {
  description = "Output value: security_group_id."
  value       = aws_security_group.this.id
}

output "security_group_name" {
  description = "Output value: security_group_name."
  value       = aws_security_group.this.name
}

output "security_group_arn" {
  description = "Output value: security_group_arn."
  value       = aws_security_group.this.arn
}
