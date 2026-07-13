# subnet Module

## Overview

Terraform module at `modules/subnet` with single responsibility.

## Managed Resources

- `aws_subnet`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `vpc_id` | Input variable. |
| `subnet_type` | Input variable. |
| `map_public_ip_on_launch` | Input variable. |
| `subnets` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `subnet_ids` | Output value. |
| `subnet_ids_by_key` | Output value. |

## Usage

```hcl
module "subnet_example" {
  source = "<relative-path-to>/modules/subnet"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
