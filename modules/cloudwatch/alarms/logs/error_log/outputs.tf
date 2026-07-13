output "alarm_name" {
  description = "Output value: alarm_name."
  value       = module.this.metric_alarm_name
}

output "alarm_arn" {
  description = "Output value: alarm_arn."
  value       = module.this.metric_alarm_arn
}

output "metric_filter_id" {
  description = "Output value: metric_filter_id."
  value       = module.this.metric_filter_id
}

output "filter_name" {
  description = "Output value: filter_name."
  value       = module.this.filter_name
}
