output "service_id" {
  description = "Output value: service_id."
  value       = aws_ecs_service.this.id
}

output "service_name" {
  description = "Output value: service_name."
  value       = aws_ecs_service.this.name
}

output "ecs_service_id" {
  description = "Output value: ecs_service_id."
  value       = aws_ecs_service.this.id
}

output "ecs_service_name" {
  description = "Output value: ecs_service_name."
  value       = aws_ecs_service.this.name
}
