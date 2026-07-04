# Terraform デプロイ用 CodePipeline (CloudFormation)

Terraform のリソースをデプロイするための CodePipeline を作成する CloudFormation テンプレート群。
**機能(network, iam 等)ごとに 1 パイプライン**を作成する構成。

## パイプライン構成

```
Source (CodeCommit)
  -> Plan   (選択ターゲットの差分チェック: terraform plan -detailed-exitcode)
  -> Approve(plan結果・コード差分を確認して手動承認。通知なし)
  -> Apply  (差分のあるターゲットのみ terraform apply)
       └ 失敗時: OnFailure: ROLLBACK により直前の成功リビジョンを自動再適用
```

- パイプラインは **V2 タイプ**。実行モードは `QUEUED`(tfstate 同時更新防止)。
- CodeCommit push による自動起動は使用せず、すべて手動で実行する。

## ファイル構成

| ファイル | 内容 |
| --- | --- |
| [dev/dev--common--resource--stack.yml](dev/dev--common--resource--stack.yml) | dev 環境共通リソース (S3/DynamoDB/IAM) |
| [prd/prd--common--resource--stack.yml](prd/prd--common--resource--stack.yml) | prd 環境共通リソース (S3/DynamoDB/IAM) |
| [dev/common/iam--pipeline--stack.yml](dev/common/iam--pipeline--stack.yml) | IAM 機能パイプライン (dev) |
| [prd/common/iam--pipeline--stack.yml](prd/common/iam--pipeline--stack.yml) | IAM 機能パイプライン (prd) |
| [dev/common/network--pipeline--stack.yml](dev/common/network--pipeline--stack.yml) | network 機能パイプライン (dev) ※Terraformルートは未作成 |
| [prd/common/network--pipeline--stack.yml](prd/common/network--pipeline--stack.yml) | network 機能パイプライン (prd) ※Terraformルートは未作成 |
| [../buildspecs/terraform-plan.yml](../buildspecs/terraform-plan.yml) | Plan ステージ用 buildspec (リポジトリにコミットする) |
| [../buildspecs/terraform-apply.yml](../buildspecs/terraform-apply.yml) | Apply ステージ用 buildspec (リポジトリにコミットする) |

## 前提条件

1. **S3 バックエンドの有効化**(必須)
   - 各 Terraform ルート(例: `infra/common/environments/dev/iam/manager-role`)の
     `backend.tf` で `terraform { backend "s3" { ... } }` を有効化すること。
   - ローカルバックエンドのままだと state が永続化されず危険なため、
     buildspec 側で S3 バックエンド未設定を検出してエラーにするガードを入れている。
2. 環境共通スタックを先にデプロイする。Artifact 用S3、Terraform state 用S3、状態ロック用DynamoDB、Terraform配布用S3、共通IAMロールを作成する。
3. ソースの CodeCommit リポジトリが存在し、buildspec(`infra/buildspecs/*.yml`)を含む
   コードがコミットされていること。

## 共通ビルド設定 JSON

CodeBuild の共通設定は環境ごとの JSON ファイルにまとめ、Terraform 配布用 S3 の `config/terraform-build.json` へ直接アップロードする。
各ビルドには機能固有の `TF_FUNCTION_PATH` と設定ファイルの S3 URI だけを渡し、Terraform バージョン、State/Lock、Terraform 配布先は buildspec が JSON から読み込む。Terraform 配布バケットは設定 JSON と同じバケットを使用する。

```powershell
# dev: Terraform ZIPを先に配置し、JSONをアップロード
$bucket = aws cloudformation list-exports --query "Exports[?Name=='dev-terraform-common-distribution-bucket-name'].Value | [0]" --output text
aws s3 cp terraform_1.9.8_linux_amd64.zip "s3://$bucket/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip"
aws s3api put-object --bucket $bucket --key config/terraform-build.json --body infra/cloudformation/dev/terraform-build-config.json

# prd: Terraform ZIPを先に配置し、JSONをアップロード
$bucket = aws cloudformation list-exports --query "Exports[?Name=='prd-terraform-common-distribution-bucket-name'].Value | [0]" --output text
aws s3 cp terraform_1.9.8_linux_amd64.zip "s3://$bucket/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip"
aws s3api put-object --bucket $bucket --key config/terraform-build.json --body infra/cloudformation/prd/terraform-build-config.json
```

アップロード前に各 JSON の `terraformStateBucketName` を、共通リソーススタックへ指定した実際のバケット名に置き換える。

JSON の例:

```json
{
  "terraformVersion": "1.9.8",
  "terraformStateBucketName": "<environment-state-bucket>",
  "terraformLockTableName": "terraform-lock-dev",
  "terraformDistributionKey": "terraform/1.9.8/terraform_1.9.8_linux_amd64.zip",
  "tfInAutomation": "1"
}
```

Terraform バージョンを更新するときは、JSON の `terraformVersion` と `terraformDistributionKey` を合わせて更新し、対応する ZIP と JSON を再アップロードする。CodeBuild ロールの読み取り権限は `config/terraform-build.json` と `terraform/*` に限定している。


## ターゲット選択 (TARGETS パイプライン変数)

パイプライン実行開始時に変数 `TARGETS` でデプロイ対象を選択できる。

| 指定 | 動作 |
| --- | --- |
| `all` (デフォルト) | 機能ディレクトリ配下の全ターゲット(例: `infra/common/environments/dev/iam` 配下の全サブディレクトリ) |
| `manager-role` | 指定ターゲットのみ |
| `manager-role@other-role` | 複数指定は `@` 区切り |

> パイプライン変数の値は `[A-Za-z0-9@-_]` のみ使用可能なため、カンマではなく `@` 区切り。

選択されたターゲットだけが plan され、**差分のあるターゲットだけが apply される**。
差分がないターゲットは apply をスキップする。

## 承認ステージでの確認内容

- Plan ステージの出力アーティファクト `plans/<target>.plan.txt` に各ターゲットの plan 全文、
  `diff-summary.txt` にターゲットごとの差分有無が出力される。
- コード差分は承認画面のリンク、または CodeCommit コンソールで対象コミットを確認。
- 確認後、CodePipeline コンソールで承認/却下を行う(通知なし)。

## ロールバックの動作

- Apply ステージ失敗時、CodePipeline のステージ条件 `OnFailure: ROLLBACK` により、
  **直前に成功した実行のソースリビジョンで Apply ステージのみ自動再実行**される。
- Apply は保存済み plan ではなく現在のソースから再 plan するため、
  失敗した apply で一部リソースが変更されていても、古いソースから現在の state に対する
  正しい復旧 plan が生成される。
- ロールバック実行に承認は不要(自動)。
- 初回実行(成功履歴がない)で失敗した場合はロールバック対象がなく、ステージは失敗のままとなる。

## network パイプラインについて

network 用テンプレート([dev](dev/common/network--pipeline--stack.yml) / [prd](prd/common/network--pipeline--stack.yml))は作成済み。
ただし Terraform ルート `infra/common/environments/{env}/network/` は未作成のため、
ルートを作成するまで Plan ステージは「TF_FUNCTION_PATH が存在しません」で失敗する(想定動作)。

## さらに新しい機能(例: rds)のパイプライン追加手順

1. `infra/common/environments/{env}/rds/` 配下に Terraform ルートを作成
   (S3 バックエンドを有効化すること)。
2. `iam--pipeline--stack.yml` をコピーして `rds--pipeline--stack.yml` を作成し、以下を変更:
   - `Description`、各リソース名の `iam` 部分(`-terraform-iam-` → `-terraform-rds-`)
   - パイプラインリソースの論理ID(`IamTerraformPipeline` → `RdsTerraformPipeline`)
   - `TF_FUNCTION_PATH` の末尾 `iam` → `rds`
  - CodeBuild名は `{env}--{product}--{function}--{plan|apply}--cb` に揃える。機能別CodeBuildロールの信頼ポリシーは `{env}--*--{function}*` のSourceArnパターンで許可する。
  - CodePipelineの `StartBuild` と `iam:PassRole` は命名パターンで許可するため、プロジェクトMappingの追加は不要
3. 上記デプロイコマンドでスタック作成。
