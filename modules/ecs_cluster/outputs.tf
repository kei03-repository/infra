output "cluster_id" {
  description = "Output value: cluster_id."
  value       = aws_ecs_cluster.this.id
}

output "cluster_name" {
  description = "Output value: cluster_name."
  value       = aws_ecs_cluster.this.name
}

output "cluster_arn" {
  description = "Output value: cluster_arn."
  value       = aws_ecs_cluster.this.arn
}

output "ecs_cluster_id" {
  description = "Output value: ecs_cluster_id."
  value       = aws_ecs_cluster.this.id
}

output "ecs_cluster_name" {
  description = "Output value: ecs_cluster_name."
  value       = aws_ecs_cluster.this.name
}

output "ecs_cluster_arn" {
  description = "Output value: ecs_cluster_arn."
  value       = aws_ecs_cluster.this.arn
}
