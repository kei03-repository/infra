output "alb_arn" {
  description = "Output value: alb_arn."
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "Output value: alb_dns_name."
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "Output value: alb_zone_id."
  value       = aws_lb.this.zone_id
}

output "alb_listener_http_arn" {
  description = "Output value: alb_listener_http_arn."
  value       = aws_lb_listener.http.arn
}

output "alb_target_group_arn" {
  description = "Output value: alb_target_group_arn."
  value       = aws_lb_target_group.this.arn
}

output "alb_target_group_name" {
  description = "Output value: alb_target_group_name."
  value       = aws_lb_target_group.this.name
}

output "target_group_arn" {
  description = "Output value: target_group_arn."
  value       = aws_lb_target_group.this.arn
}
