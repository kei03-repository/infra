# metric_alarm Module

## Overview

Terraform module at `modules/cloudwatch/alarms/common/metric_alarm` with single responsibility.

## Managed Resources

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
| `namespace` | Input variable. |
| `metric_name` | Input variable. |
| `statistic` | Input variable. |
| `unit` | Input variable. |
| `dimensions` | Input variable. |
| `treat_missing_data` | Input variable. |
| `actions_enabled` | Input variable. |
| `alarm_actions` | Input variable. |
| `ok_actions` | Input variable. |
| `insufficient_data_actions` | Input variable. |
| `tags` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `alarm_name` | Output value. |
| `alarm_arn` | Output value. |
| `alarm_id` | Output value. |

## Usage

```hcl
module "metric_alarm_example" {
  source = "<relative-path-to>/modules/cloudwatch/alarms/common/metric_alarm"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
