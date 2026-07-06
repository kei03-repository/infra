locals {
  rule_name = coalesce(var.rule_name, "${var.environment}--${var.product_name}--ecs--stopped-event")
  detail = merge({
    lastStatus = ["STOPPED"]
  }, var.cluster_arn != null ? { clusterArn = [var.cluster_arn] } : {}, var.service_arn != null ? { serviceArn = [var.service_arn] } : {})
  event_pattern = coalesce(var.event_pattern, jsonencode({
    source        = ["aws.ecs"]
    "detail-type" = ["ECS Task State Change"]
    detail        = local.detail
  }))
}

module "this" {
  source = "../../common/event_rule_alert"

  rule_name       = local.rule_name
  description     = var.description
  event_bus_name  = var.event_bus_name
  event_pattern   = local.event_pattern
  is_enabled      = coalesce(var.is_enabled, var.actions_enabled)
  target_arn      = var.target_arn
  target_role_arn = var.target_role_arn
  target_input    = var.target_input
  tags            = var.tags
}