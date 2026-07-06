# security_group Module

## Overview

Terraform module at `modules/security_group` with single responsibility.

## Managed Resources

- `aws_security_group`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `vpc_id` | Input variable. |
| `security_group_name` | Input variable. |
| `ingress_rules` | Input variable. |
| `egress_rules` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `alb_sg_id` | Output value. |
| `app_sg_id` | Output value. |
| `db_sg_id` | Output value. |
| `alb_security_group_id` | Output value. |
| `app_security_group_id` | Output value. |
| `db_security_group_id` | Output value. |
| `security_group_id` | Output value. |
| `security_group_name` | Output value. |
| `security_group_arn` | Output value. |

## Usage

```hcl
module "security_group_example" {
  source = "<relative-path-to>/modules/security_group"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
