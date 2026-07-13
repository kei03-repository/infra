# github-actions-role Module

## Overview

Terraform module at `modules/iam/roles/github-actions-role` with single responsibility.

## Managed Resources

- `aws_iam_policy`
- `aws_iam_role`
- `aws_iam_role_policy_attachment`

## Inputs

| Name | Description |
|---|---|
| `role_name` | Input variable. |
| `github_organization` | Input variable. |
| `github_repositories` | Input variable. |
| `oidc_provider_arn` | Input variable. |
| `tags` | Input variable. |

## Outputs

| Name | Description |
|---|---|
| `role_arn` | Output value. |
| `role_id` | Output value. |
| `role_name` | Output value. |
| `policy_arn` | Output value. |

## Usage

```hcl
module "github-actions-role_example" {
  source = "<relative-path-to>/modules/iam/roles/github-actions-role"
  # set required inputs
}
```

## Constraints

- Do not define Provider/Backend/Remote State inside module.
- Pass environment/product-specific values from caller side.
