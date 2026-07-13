# manager-role Module

## Overview

Terraform module at `modules/iam/roles/manager-role` with single responsibility.

## Managed Resources

- `aws_iam_policy`
- `aws_iam_role`
- `aws_iam_role_policy_attachment`

## Inputs

| Name | Description |
|---|---|
| `role_name` | Input variable. |
| `assume_role_account_id` | Input variable. |
| `tags` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `role_arn` | Output value. |
| `role_id` | Output value. |
| `role_name` | Output value. |
| `policy_arn` | Output value. |
| `assume_role_command` | Output value. |

## Usage

```hcl
module "manager-role_example" {
  source = "<relative-path-to>/modules/iam/roles/manager-role"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
