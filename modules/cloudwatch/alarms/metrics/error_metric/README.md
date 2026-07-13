# error_metric Module

## Overview

Terraform module at `modules/cloudwatch/alarms/metrics/error_metric` with single responsibility.

## Managed Resources

- None

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `alarm_name` | Input variable. |
| `alarm_description` | Input variable. |
| `namespace` | Input variable. |
| `metric_name` | Input variable. |
| `comparison_operator` | Input variable. |
| `threshold` | Input variable. |
| `period` | Input variable. |
| `evaluation_periods` | Input variable. |
| `datapoints_to_alarm` | Input variable. |
| `statistic` | Input variable. |
| `unit` | Input variable. |
| `dimensions` | Input variable. |
| `treat_missing_data` | Input variable. |
| `actions_enabled` | Input variable. |
| `tags` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `alarm_name` | Output value. |
| `alarm_arn` | Output value. |
| `alarm_id` | Output value. |

## Usage

```hcl
module "error_metric_example" {
  source = "<relative-path-to>/modules/cloudwatch/alarms/metrics/error_metric"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
