output "task_definition_arn" {
  description = "Output value: task_definition_arn."
  value       = aws_ecs_task_definition.this.arn
}

output "task_definition_family" {
  description = "Output value: task_definition_family."
  value       = aws_ecs_task_definition.this.family
}

output "task_definition_revision" {
  description = "Output value: task_definition_revision."
  value       = aws_ecs_task_definition.this.revision
}

output "ecs_task_definition_arn" {
  description = "Output value: ecs_task_definition_arn."
  value       = aws_ecs_task_definition.this.arn
}
