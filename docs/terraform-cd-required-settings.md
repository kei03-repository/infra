# Terraform CD Required Settings

## GitHub Environments

Create these environments in the repository settings:

- `terraform-dev`
- `terraform-prd`

Set required reviewers:

- `terraform-dev`: 1 reviewer
- `terraform-prd`: 1 reviewer

## GitHub Variables

Required repository variables:

- `AWS_REGION`
- `TFSTATE_BUCKET_DEV`
- `TFSTATE_DYNAMODB_TABLE_DEV`
- `TFSTATE_BUCKET_PRD`
- `TFSTATE_DYNAMODB_TABLE_PRD`
- `APP_REPOSITORY` (example: `your-org/kintai`)
- `SONAR_PROJECT_KEY`
- `SONAR_PROJECT_NAME`
- `SONAR_HOST_URL_ECS` (example: `http://sonarqube.internal.example.com`)

## GitHub Secrets

Required repository secrets:

- `AWS_ROLE_ARN_DEV`
- `AWS_ROLE_ARN_PRD`
- `APP_REPO_READ_TOKEN`
- `SONAR_TOKEN`

## SonarQube note

- SonarQube step is currently commented out in workflow.
- When enabling, set `SONAR_HOST_URL_ECS` to your ECS SonarQube endpoint and keep `SONAR_TOKEN` in Secrets.

## Notes

- PR comments are posted with Terraform plan summaries.
- Audit records are available in step summaries and workflow artifacts.
