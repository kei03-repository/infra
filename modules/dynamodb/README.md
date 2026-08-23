# dynamodb Module

## Overview

Terraform module at `modules/dynamodb` with single responsibility.

## Managed Resources

- `aws_dynamodb_table`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `hash_key` | Input variable. |
| `range_key` | Input variable. |
| `billing_mode` | Input variable. |
| `attributes` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `table_name` | Output value. |
| `table_arn` | Output value. |
| `table_id` | Output value. |
| `dynamodb_table_name` | Output value. |
| `dynamodb_table_arn` | Output value. |
| `dynamodb_table_id` | Output value. |

## Usage

```hcl
module "dynamodb_example" {
  source = "<relative-path-to>/modules/dynamodb"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
