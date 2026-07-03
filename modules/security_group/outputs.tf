output "alb_sg_id" {
	value = aws_security_group.this.id
}

output "app_sg_id" {
	value = aws_security_group.this.id
}

output "db_sg_id" {
	value = aws_security_group.this.id
}

output "alb_security_group_id" {
	value = aws_security_group.this.id
}

output "app_security_group_id" {
	value = aws_security_group.this.id
}

output "db_security_group_id" {
	value = aws_security_group.this.id
}

output "security_group_id" {
	value = aws_security_group.this.id
}

output "security_group_name" {
	value = aws_security_group.this.name
}

output "security_group_arn" {
	value = aws_security_group.this.arn
}
