# s3 Module

## Overview

Terraform module at `modules/s3` with single responsibility.

## Managed Resources

- `aws_s3_bucket`
- `aws_s3_bucket_public_access_block`
- `aws_s3_bucket_server_side_encryption_configuration`
- `aws_s3_bucket_versioning`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `bucket_name` | Input variable. |
| `kms_key_arn` | Input variable. |
| `versioning_enabled` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `bucket_id` | Output value. |
| `bucket_arn` | Output value. |
| `bucket_name` | Output value. |
| `s3_bucket_id` | Output value. |
| `s3_bucket_arn` | Output value. |
| `s3_bucket_name` | Output value. |

## Usage

```hcl
module "s3_example" {
  source = "<relative-path-to>/modules/s3"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
