# lambda Module

## Overview

Terraform module at `modules/iam/roles/lambda` with single responsibility.

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
| `enable_vpc_access` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `role_id` | Output value. |
| `role_name` | Output value. |
| `role_arn` | Output value. |
| `lambda_role_id` | Output value. |
| `lambda_role_name` | Output value. |
| `lambda_role_arn` | Output value. |

## Usage

```hcl
module "lambda_example" {
  source = "<relative-path-to>/modules/iam/roles/lambda"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
