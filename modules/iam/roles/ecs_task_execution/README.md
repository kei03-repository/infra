# ecs_task_execution Module

## Overview

Terraform module at `modules/iam/roles/ecs_task_execution` with single responsibility.

## Managed Resources

- `aws_iam_role`
- `aws_iam_role_policy`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `role_name` | Input variable. |
| `log_group_arns` | Input variable. |
| `ecr_repository_arns` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `role_id` | Output value. |
| `role_name` | Output value. |
| `role_arn` | Output value. |
| `ecs_task_execution_role_id` | Output value. |
| `ecs_task_execution_role_name` | Output value. |
| `ecs_task_execution_role_arn` | Output value. |

## Usage

```hcl
module "ecs_task_execution_example" {
  source = "<relative-path-to>/modules/iam/roles/ecs_task_execution"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
