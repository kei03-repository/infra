# common-network

`common/dev/common-network` は、common 用のネットワーク Root Module です。

## ファイル構成

- `backend.tf`
- `provider.tf`
- `versions.tf`
- `variables.tf`
- `locals.tf`
- `main.tf`
- `outputs.tf`
- `terraform.tfvars`
- `.gitignore`
- `README.md`

## 構成

- VPC: 1つ
- Public subnet: 1つ
- Private subnet: 2つ
- Availability Zone: `ap-northeast-1a`

## CIDR

- VPC: `10.20.0.0/20`
- Public subnet: `10.20.0.0/24`
- Private subnet A: `10.20.4.0/24`
- Private subnet B: `10.20.5.0/24`

## 方針

- プロダクト名は `common`
- dev 環境は単一 AZ とする
- private subnet は同一 AZ に配置する
- modules/vpc と modules/subnet を利用する

## State

このディレクトリは Root Module として扱い、将来的には `backend.tf` で S3 backend に切り替えます。

## 参照モジュール

- `modules/vpc`
- `modules/subnet`
