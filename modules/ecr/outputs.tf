output "repository_name" {
  description = "Output value: repository_name."
  value       = aws_ecr_repository.this.name
}

output "repository_url" {
  description = "Output value: repository_url."
  value       = aws_ecr_repository.this.repository_url
}

output "repository_arn" {
  description = "Output value: repository_arn."
  value       = aws_ecr_repository.this.arn
}

output "ecr_repository_name" {
  description = "Output value: ecr_repository_name."
  value       = aws_ecr_repository.this.name
}

output "ecr_repository_url" {
  description = "Output value: ecr_repository_url."
  value       = aws_ecr_repository.this.repository_url
}

output "ecr_repository_arn" {
  description = "Output value: ecr_repository_arn."
  value       = aws_ecr_repository.this.arn
}
