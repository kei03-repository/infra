# stopped_event Module

## Overview

Terraform module at `modules/cloudwatch/alarms/ecs/stopped_event` with single responsibility.

## Managed Resources

- None

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `rule_name` | Input variable. |
| `description` | Input variable. |
| `event_bus_name` | Input variable. |
| `event_pattern` | Input variable. |
| `cluster_arn` | Input variable. |
| `service_arn` | Input variable. |
| `is_enabled` | Input variable. |
| `actions_enabled` | Input variable. |
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
module "stopped_event_example" {
  source = "<relative-path-to>/modules/cloudwatch/alarms/ecs/stopped_event"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
