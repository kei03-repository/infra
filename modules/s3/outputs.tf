output "bucket_id" {
  description = "Output value: bucket_id."
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "Output value: bucket_arn."
  value       = aws_s3_bucket.this.arn
}

output "bucket_name" {
  description = "Output value: bucket_name."
  value       = aws_s3_bucket.this.bucket
}

output "s3_bucket_id" {
  description = "Output value: s3_bucket_id."
  value       = aws_s3_bucket.this.id
}

output "s3_bucket_arn" {
  description = "Output value: s3_bucket_arn."
  value       = aws_s3_bucket.this.arn
}

output "s3_bucket_name" {
  description = "Output value: s3_bucket_name."
  value       = aws_s3_bucket.this.bucket
}
