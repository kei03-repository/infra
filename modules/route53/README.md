# route53 Module

## Overview

Terraform module at `modules/route53` with single responsibility.

## Managed Resources

- `aws_route53_record`

## Inputs

| Name | Description |
|---|---|
| `zone_id` | Input variable. |
| `record_name` | Input variable. |
| `alias_name` | Input variable. |
| `alias_zone_id` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| None | - |

## Usage

```hcl
module "route53_example" {
  source = "<relative-path-to>/modules/route53"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
