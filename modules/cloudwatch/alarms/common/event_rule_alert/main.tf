resource "aws_cloudwatch_event_rule" "this" {
  name          = var.rule_name
  description   = var.description
  event_bus_name = var.event_bus_name
  event_pattern = var.event_pattern
  is_enabled    = var.is_enabled

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "this" {
  rule           = aws_cloudwatch_event_rule.this.name
  event_bus_name  = var.event_bus_name
  arn            = var.target_arn
  role_arn       = var.target_role_arn
  input          = var.target_input
}