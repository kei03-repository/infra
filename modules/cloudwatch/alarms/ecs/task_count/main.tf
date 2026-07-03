locals {
  alarm_name = coalesce(var.alarm_name, "${var.environment}--${var.product_name}--ecs--task-count")
  base_dimensions = var.service_name == null ? {
    ClusterName = var.cluster_name
  } : {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }
  dimensions = merge(local.base_dimensions, var.dimensions)
}

module "this" {
  source = "../../common/metric_alarm"

  alarm_name                = local.alarm_name
  alarm_description         = var.alarm_description
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  datapoints_to_alarm       = var.datapoints_to_alarm
  threshold                 = var.threshold
  period                    = var.period
  namespace                 = var.namespace
  metric_name               = var.metric_name
  statistic                 = var.statistic
  unit                      = var.unit
  dimensions                = local.dimensions
  treat_missing_data        = var.treat_missing_data
  actions_enabled           = var.actions_enabled
  alarm_actions             = []
  ok_actions                = []
  insufficient_data_actions = []
  tags                      = var.tags
}