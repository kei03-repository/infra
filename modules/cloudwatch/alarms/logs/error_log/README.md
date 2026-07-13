# error_log Module

## Overview

Terraform module at `modules/cloudwatch/alarms/logs/error_log` with single responsibility.

## Managed Resources

- None

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
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
| `alarm_name` | Output value. |
| `alarm_arn` | Output value. |
| `metric_filter_id` | Output value. |
| `filter_name` | Output value. |

## Usage

```hcl
module "error_log_example" {
  source = "<relative-path-to>/modules/cloudwatch/alarms/logs/error_log"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
