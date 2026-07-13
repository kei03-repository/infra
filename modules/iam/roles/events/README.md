# events Module

## Overview

Terraform module at `modules/iam/roles/events` with single responsibility.

## Managed Resources

- `aws_iam_role`
- `aws_iam_role_policy`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `role_name` | Input variable. |
| `target_arns` | Input variable. |
| `target_actions` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `role_id` | Output value. |
| `role_name` | Output value. |
| `role_arn` | Output value. |
| `events_role_id` | Output value. |
| `events_role_name` | Output value. |
| `events_role_arn` | Output value. |

## Usage

```hcl
module "events_example" {
  source = "<relative-path-to>/modules/iam/roles/events"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
