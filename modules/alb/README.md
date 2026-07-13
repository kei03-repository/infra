# alb Module

## Overview

Terraform module at `modules/alb` with single responsibility.

## Managed Resources

- `aws_lb`
- `aws_lb_listener`
- `aws_lb_target_group`

## Inputs

| Name | Description |
|---|---|
| `product_name` | Input variable. |
| `environment` | Input variable. |
| `vpc_id` | Input variable. |
| `subnet_ids` | Input variable. |
| `alb_security_group_id` | Input variable. |
| `certificate_arn` | Input variable. |
| `deployment_color` | Input variable. |
| `target_port` | Input variable. |
| `health_check_path` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `alb_arn` | Output value. |
| `alb_dns_name` | Output value. |
| `alb_zone_id` | Output value. |
| `alb_listener_http_arn` | Output value. |
| `alb_target_group_arn` | Output value. |
| `alb_target_group_name` | Output value. |
| `target_group_arn` | Output value. |

## Usage

```hcl
module "alb_example" {
  source = "<relative-path-to>/modules/alb"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
