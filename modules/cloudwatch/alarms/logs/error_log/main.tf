locals {
  alarm_name = coalesce(var.alarm_name, "${var.environment}--${var.product_name}--logs--error")
}

module "this" {
  source = "../../common/log_metric_alarm"

  alarm_name                = local.alarm_name
  alarm_description         = var.alarm_description
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  datapoints_to_alarm       = var.datapoints_to_alarm
  threshold                 = var.threshold
  period                    = var.period
  statistic                 = var.statistic
  treat_missing_data        = var.treat_missing_data
  actions_enabled           = var.actions_enabled
  alarm_actions             = []
  ok_actions                = []
  insufficient_data_actions = []
  log_group_name            = var.log_group_name
  filter_name               = var.filter_name
  filter_pattern            = var.filter_pattern
  metric_namespace          = var.metric_namespace
  metric_name               = var.metric_name
  metric_value              = var.metric_value
  metric_default_value      = var.metric_default_value
  dimensions                = var.dimensions
  tags                      = var.tags
}