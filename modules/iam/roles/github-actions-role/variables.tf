variable "role_name" {
  description = "IAM role name for GitHub Actions."
  type        = string
}

variable "github_organization" {
  description = "GitHub organization name."
  type        = string
}

variable "github_repositories" {
  description = "List of allowed GitHub repositories under the organization."
  type        = list(string)
}

variable "oidc_provider_arn" {
  description = "GitHub OIDC Provider ARN"
  type        = string
}

variable "tags" {
  description = "Tags applied to created resources."
  type        = map(string)
  default     = {}
}
