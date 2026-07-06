output "alarm_name" {
  description = "Output value: alarm_name."
  value       = aws_cloudwatch_metric_alarm.this.alarm_name
}

output "alarm_arn" {
  description = "Output value: alarm_arn."
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "alarm_id" {
  description = "Output value: alarm_id."
  value       = aws_cloudwatch_metric_alarm.this.id
}
