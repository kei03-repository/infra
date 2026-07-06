resource "aws_cloudwatch_log_metric_filter" "this" {
  name           = var.filter_name
  log_group_name = var.log_group_name
  pattern        = var.filter_pattern

  metric_transformation {
    name          = var.metric_name
    namespace     = var.metric_namespace
    value         = var.metric_value
    default_value = var.metric_default_value
  }
}

resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name                = var.alarm_name
  alarm_description         = var.alarm_description
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  datapoints_to_alarm       = var.datapoints_to_alarm
  threshold                 = var.threshold
  period                    = var.period
  namespace                 = var.metric_namespace
  metric_name               = var.metric_name
  statistic                 = var.statistic
  dimensions                = var.dimensions
  treat_missing_data        = var.treat_missing_data
  actions_enabled           = var.actions_enabled
  alarm_actions             = var.alarm_actions
  ok_actions                = var.ok_actions
  insufficient_data_actions = var.insufficient_data_actions

  tags = var.tags
}