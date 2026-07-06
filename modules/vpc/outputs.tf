output "vpc_id" {
  description = "Output value: vpc_id."
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "Output value: vpc_cidr_block."
  value       = aws_vpc.this.cidr_block
}
