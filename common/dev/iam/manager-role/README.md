# Manager Role - Dev 環境

このディレクトリには、Dev 環境用の Manager Role を作成するための Terraform 構成が含まれています。

## 概要

- **ロール名**: `manager-role`
- **用途**: 別アカウント（961647101013）からのスイッチロール
- **目的**: Terraform による AWS リソース管理を別アカウントから実行するため

## 前提条件

- Terraform >= 1.0
- AWS CLI >= 2.x
- 適切な AWS 認証情報が設定されていること

## ファイル構成

```
.
├── main.tf                 # モジュール呼び出し定義
├── variables.tf            # 入力変数定義
├── outputs.tf              # 出力値定義
├── provider.tf             # AWS プロバイダー設定
├── data.tf                 # データソース定義
├── backend.tf              # Terraform State バックエンド設定
└── terraform.tfvars        # 変数値設定
```

## 使用方法

### 1. 初期化

```bash
cd infra/common/environments/dev/iam/manager-role
terraform init
```

### 2. 計画表示

```bash
terraform plan
```

### 3. 適用

```bash
terraform apply
```

### 4. 出力値の確認

```bash
terraform output
```

## ロールの権限

### 許可する操作

- EC2、RDS、ALB、DynamoDB などの AWS リソース作成・変更
- Lambda、CloudWatch、S3 などのサービス操作
- Code* サービス（CodeCommit、CodeBuild、CodeDeploy、CodePipeline）の操作
- 新規リソース作成（Create 操作）

### 拒否する操作

- リソースの削除（Delete）
- 既存リソースの変更（Update/Modify）
- サービスの停止・無効化（Stop/Disable）
- ネットワーク設定の変更
- IAM の変更
- CloudFormation の操作
- KMS、CloudTrail、AWS Config の設定変更

## スイッチロール方法

### AWS Console でのスイッチロール

出力値 `switch_role_url` の URL を使用してコンソールでスイッチロールできます。

### AWS CLI でのスイッチロール

```bash
aws sts assume-role \
  --role-arn arn:aws:iam::ACCOUNT_ID:role/manager-role \
  --role-session-name manager-session
```

出力値 `assume_role_command` を参照してください。

## 状態管理

現在、ローカル状態ファイルを使用しています。

本番環境では `backend.tf` で S3 バックエンドに切り替えることを推奨します：

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "dev/iam/manager-role/terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
```

## トラブルシューティング

### Assume Role に失敗する場合

1. スイッチロール元のアカウント ID が正しいか確認
2. アカウント ID が 961647101013 であることを確認
3. `terraform.tfvars` の `assume_role_account_id` を確認

### State ファイルのロック

複数ユーザーで実行する場合は、DynamoDB を使用した状態ロックの設定をお勧めします。

## 変更履歴

- 2026-07-05: 初版作成
