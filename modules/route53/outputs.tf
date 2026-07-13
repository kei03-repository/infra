output "record_fqdn" {
  description = "FQDN of the created Route53 alias record."
  value       = aws_route53_record.alias.fqdn
}
