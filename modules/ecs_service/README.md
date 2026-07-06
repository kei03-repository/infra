# ecs_service Module

## Overview

Terraform module at `modules/ecs_service` with single responsibility.

## Managed Resources

- `aws_ecs_service`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `service_name` | Input variable. |
| `cluster_arn` | Input variable. |
| `task_definition_arn` | Input variable. |
| `subnet_ids` | Input variable. |
| `security_group_id` | Input variable. |
| `target_group_arn` | Input variable. |
| `container_name` | Input variable. |
| `container_port` | Input variable. |
| `desired_count` | Input variable. |
| `assign_public_ip` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `service_id` | Output value. |
| `service_name` | Output value. |
| `ecs_service_id` | Output value. |
| `ecs_service_name` | Output value. |

## Usage

```hcl
module "ecs_service_example" {
  source = "<relative-path-to>/modules/ecs_service"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
