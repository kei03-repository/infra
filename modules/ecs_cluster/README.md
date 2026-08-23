# ecs_cluster Module

## Overview

Terraform module at `modules/ecs_cluster` with single responsibility.

## Managed Resources

- `aws_ecs_cluster`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `cluster_id` | Output value. |
| `cluster_name` | Output value. |
| `cluster_arn` | Output value. |
| `ecs_cluster_id` | Output value. |
| `ecs_cluster_name` | Output value. |
| `ecs_cluster_arn` | Output value. |

## Usage

```hcl
module "ecs_cluster_example" {
  source = "<relative-path-to>/modules/ecs_cluster"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
