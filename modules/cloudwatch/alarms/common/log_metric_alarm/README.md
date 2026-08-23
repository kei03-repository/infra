# log_metric_alarm Module

## Overview

Terraform module at `modules/cloudwatch/alarms/common/log_metric_alarm` with single responsibility.

## Managed Resources

- `aws_cloudwatch_log_metric_filter`
- `aws_cloudwatch_metric_alarm`

## Inputs

| Name | Description |
|---|---|
| `alarm_name` | Input variable. |
| `alarm_description` | Input variable. |
| `comparison_operator` | Input variable. |
| `evaluation_periods` | Input variable. |
| `datapoints_to_alarm` | Input variable. |
| `threshold` | Input variable. |
| `period` | Input variable. |
| `statistic` | Input variable. |
| `treat_missing_data` | Input variable. |
| `actions_enabled` | Input variable. |
| `alarm_actions` | Input variable. |
| `ok_actions` | Input variable. |
| `insufficient_data_actions` | Input variable. |
| `log_group_name` | Input variable. |
| `filter_name` | Input variable. |
| `filter_pattern` | Input variable. |
| `metric_namespace` | Input variable. |
| `metric_name` | Input variable. |
| `metric_value` | Input variable. |
| `metric_default_value` | Input variable. |
| `dimensions` | Input variable. |
| `tags` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `filter_name` | Output value. |
| `metric_alarm_name` | Output value. |
| `metric_alarm_arn` | Output value. |
| `metric_filter_id` | Output value. |

## Usage

```hcl
module "log_metric_alarm_example" {
  source = "<relative-path-to>/modules/cloudwatch/alarms/common/log_metric_alarm"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
