# GitHub Actions Role - Dev 環境

このディレクトリには、Dev 環境用の GitHub Actions Role を作成するための Terraform 構成が含まれています。

## 概要

- ロール名: `DEV-GitHub-Actions-Role`
- 用途: GitHub Actions OIDC で AWS を AssumeRole して Terraform を実行
- 目的: Terraform 実行権限を CI/CD 用ロールへ集約し、運用者ロールと分離

## 前提条件

- Terraform >= 1.0
- AWS CLI >= 2.x
- AWS アカウント上に GitHub OIDC Provider（`token.actions.githubusercontent.com`）が作成済み

## 使用方法

1. `terraform.tfvars` の値を環境に合わせて修正
2. `terraform init`
3. `terraform plan`
4. `terraform apply`

## 注意

- `github_repositories` には owner を除いたリポジトリ名を指定します。
- 例: `github_organization = "my-org"`, `github_repositories = ["infra"]`
