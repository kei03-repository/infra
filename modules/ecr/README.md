# ecr Module

## Overview

Terraform module at `modules/ecr` with single responsibility.

## Managed Resources

- `aws_ecr_repository`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `repository_name` | Input variable. |
| `force_delete` | Input variable. |
| `scan_on_push` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `repository_name` | Output value. |
| `repository_url` | Output value. |
| `repository_arn` | Output value. |
| `ecr_repository_name` | Output value. |
| `ecr_repository_url` | Output value. |
| `ecr_repository_arn` | Output value. |

## Usage

```hcl
module "ecr_example" {
  source = "<relative-path-to>/modules/ecr"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
