# managed_policy Module

## Overview

Terraform module at `modules/iam/policies/managed_policy` with single responsibility.

## Managed Resources

- `aws_iam_policy`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `policy_name` | Input variable. |
| `description` | Input variable. |
| `path` | Input variable. |
| `policy_json` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `policy_id` | Output value. |
| `policy_name` | Output value. |
| `policy_arn` | Output value. |
| `managed_policy_id` | Output value. |
| `managed_policy_name` | Output value. |
| `managed_policy_arn` | Output value. |

## Usage

```hcl
module "managed_policy_example" {
  source = "<relative-path-to>/modules/iam/policies/managed_policy"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
