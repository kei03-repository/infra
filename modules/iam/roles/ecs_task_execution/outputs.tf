output "role_id" {
  value = aws_iam_role.this.id
}

output "role_name" {
  value = aws_iam_role.this.name
}

output "role_arn" {
  value = aws_iam_role.this.arn
}

output "ecs_task_execution_role_id" {
  value = aws_iam_role.this.id
}

output "ecs_task_execution_role_name" {
  value = aws_iam_role.this.name
}

output "ecs_task_execution_role_arn" {
  value = aws_iam_role.this.arn
}
