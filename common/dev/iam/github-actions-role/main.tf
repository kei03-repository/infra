# github-actions-role モジュール呼び出し
module "github_actions_role" {
  source = "../../../../modules/iam/roles/github-actions-role"

  role_name           = "DEV-GitHub-Actions-Role"
  github_organization = var.github_organization
  github_repositories = var.github_repositories
  oidc_provider_arn   = var.oidc_provider_arn

  tags = {
    Name        = "DEV-GitHub-Actions-Role"
    Environment = var.environment
  }
}
