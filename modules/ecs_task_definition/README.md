# ecs_task_definition Module

## Overview

Terraform module at `modules/ecs_task_definition` with single responsibility.

## Managed Resources

- `aws_ecs_task_definition`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `task_definition_name` | Input variable. |
| `execution_role_arn` | Input variable. |
| `task_role_arn` | Input variable. |
| `container_definitions` | Input variable. |
| `cpu` | Input variable. |
| `memory` | Input variable. |
| `network_mode` | Input variable. |
| `requires_compatibilities` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `task_definition_arn` | Output value. |
| `task_definition_family` | Output value. |
| `task_definition_revision` | Output value. |
| `ecs_task_definition_arn` | Output value. |

## Usage

```hcl
module "ecs_task_definition_example" {
  source = "<relative-path-to>/modules/ecs_task_definition"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
