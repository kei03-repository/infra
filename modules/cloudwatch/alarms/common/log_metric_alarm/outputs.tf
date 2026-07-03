output "filter_name" {
  value = aws_cloudwatch_log_metric_filter.this.name
}

output "metric_alarm_name" {
  value = aws_cloudwatch_metric_alarm.this.alarm_name
}

output "metric_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.this.arn
}

output "metric_filter_id" {
  value = aws_cloudwatch_log_metric_filter.this.id
}
