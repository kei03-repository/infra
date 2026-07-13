# vpc Module

## Overview

Terraform module at `modules/vpc` with single responsibility.

## Managed Resources

- `aws_vpc`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `cidr_block` | Input variable. |
| `enable_dns_support` | Input variable. |
| `enable_dns_hostnames` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `vpc_id` | Output value. |
| `vpc_cidr_block` | Output value. |

## Usage

```hcl
module "vpc_example" {
  source = "<relative-path-to>/modules/vpc"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
