# ecs_task Module

## Overview

Terraform module at `modules/iam/roles/ecs_task` with single responsibility.

## Managed Resources

- `aws_iam_role`
- `aws_iam_role_policy`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `role_name` | Input variable. |
| `dynamodb_table_arns` | Input variable. |
| `s3_bucket_arns` | Input variable. |
| `s3_object_arns` | Input variable. |
| `kms_key_arns` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `role_id` | Output value. |
| `role_name` | Output value. |
| `role_arn` | Output value. |
| `ecs_task_role_id` | Output value. |
| `ecs_task_role_name` | Output value. |
| `ecs_task_role_arn` | Output value. |

## Usage

```hcl
module "ecs_task_example" {
  source = "<relative-path-to>/modules/iam/roles/ecs_task"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
