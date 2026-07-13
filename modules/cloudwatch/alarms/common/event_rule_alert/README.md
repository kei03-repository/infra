# event_rule_alert Module

## Overview

Terraform module at `modules/cloudwatch/alarms/common/event_rule_alert` with single responsibility.

## Managed Resources

- `aws_cloudwatch_event_rule`
- `aws_cloudwatch_event_target`

## Inputs

| Name | Description |
|---|---|
| `rule_name` | Input variable. |
| `description` | Input variable. |
| `event_bus_name` | Input variable. |
| `event_pattern` | Input variable. |
| `is_enabled` | Input variable. |
| `target_arn` | Input variable. |
| `target_role_arn` | Input variable. |
| `target_input` | Input variable. |
| `tags` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `rule_name` | Output value. |
| `rule_arn` | Output value. |
| `target_id` | Output value. |

## Usage

```hcl
module "event_rule_alert_example" {
  source = "<relative-path-to>/modules/cloudwatch/alarms/common/event_rule_alert"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
