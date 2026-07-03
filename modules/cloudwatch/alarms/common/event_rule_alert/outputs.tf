output "rule_name" {
  value = aws_cloudwatch_event_rule.this.name
}

output "rule_arn" {
  value = aws_cloudwatch_event_rule.this.arn
}

output "target_id" {
  value = aws_cloudwatch_event_target.this.id
}
