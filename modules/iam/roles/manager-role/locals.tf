locals {
  role_name = var.role_name

  # 運用者向け最小権限（閲覧 + 限定操作）
  manager_allowed_actions = [
    # 共通
    "sts:GetCallerIdentity",
    "tag:GetResources",
    "resourcegroupstaggingapi:GetResources",
    "resourcegroupstaggingapi:GetTagKeys",
    "resourcegroupstaggingapi:GetTagValues",
    "ssm:GetParameter",
    "ssm:GetParameters",
    "ssm:GetParametersByPath",
    "ssm:DescribeParameters",
    # EC2 / RDS / ALB
    "ec2:Describe*",
    "rds:Describe*",
    "elasticloadbalancing:Describe*",
    # ECS（閲覧 + 限定操作）
    "ecs:Describe*",
    "ecs:List*",
    "ecs:UpdateService",
    # DynamoDB
    "dynamodb:Describe*",
    "dynamodb:List*",
    "dynamodb:Query",
    "dynamodb:Scan",
    # Lambda
    "lambda:Get*",
    "lambda:List*",
    # CloudWatch / Logs
    "cloudwatch:Get*",
    "cloudwatch:List*",
    "cloudwatch:Describe*",
    "logs:Describe*",
    "logs:Get*",
    "logs:FilterLogEvents",
    "logs:StartQuery",
    "logs:StopQuery",
    # S3
    "s3:ListAllMyBuckets",
    "s3:ListBucket",
    "s3:GetBucketLocation",
    "s3:GetBucketTagging",
    "s3:GetObject",
    # ECR
    "ecr:Describe*",
    "ecr:List*",
    "ecr:BatchGetImage",
    "ecr:GetDownloadUrlForLayer",
    # Code 系
    "codecommit:Get*",
    "codecommit:List*",
    "codecommit:BatchGet*",
    "codepipeline:Get*",
    "codepipeline:List*",
    "codepipeline:StartPipelineExecution",
  ]

  # 拒否するアクション（環境が壊れることを防ぐため）
  # Get/Describe/Create は許可、Delete/Update/Modify/Disable などの破壊的操作を拒否
  denied_actions = [
    # ネットワーク関連（削除・変更）
    "ec2:DeleteVpc",
    "ec2:ModifyVpcAttribute",
    "ec2:DeleteSubnet",
    "ec2:ModifySubnetAttribute",
    "ec2:DeleteRouteTable",
    "ec2:DeleteRoute",
    "ec2:ReplaceRoute",
    "ec2:AuthorizeSecurityGroupIngress",
    "ec2:AuthorizeSecurityGroupEgress",
    "ec2:RevokeSecurityGroupIngress",
    "ec2:RevokeSecurityGroupEgress",
    "ec2:DeleteNetworkAcl",
    "ec2:DeleteNetworkAclEntry",
    "ec2:ModifyNetworkInterfaceAttribute",
    # ECS（削除）
    "ecs:DeleteService",
    "ecs:DeregisterTaskDefinition",
    # IAM
    "iam:*",
    # CloudFormation
    "cloudformation:UpdateStack",
    "cloudformation:DeleteStack",
    "cloudformation:ExecuteChangeSet",
    "cloudformation:DeleteChangeSet",
    # アカウント設定
    "account:*",
    "organizations:*",
    "billing:*",
    # KMS（削除・変更・無効化）
    "kms:ScheduleKeyDeletion",
    "kms:DisableKey",
    "kms:DeleteAlias",
    "kms:PutKeyPolicy",
    # CloudTrail（削除・変更）
    "cloudtrail:DeleteTrail",
    "cloudtrail:StopLogging",
    "cloudtrail:UpdateTrail",
    "cloudtrail:PutEventSelectors",
    # AWS Config（削除・変更）
    "config:DeleteConfigurationAggregator",
    "config:DeleteConfigurationRecorder",
    "config:StopConfigurationRecorder",
    "config:DeleteDeliveryChannel",
    # Secrets Manager（削除）
    "secretsmanager:DeleteSecret",
    # RDS（削除・変更）
    "rds:DeleteDBInstance",
    "rds:DeleteDBCluster",
    "rds:ModifyDBInstance",
    # コードストレージ（削除・破壊的変更）
    "codecommit:DeleteRepository",
    "codecommit:DeleteBranch",
    # CodePipeline（削除）
    "codepipeline:DeletePipeline",
    # 全般的な削除系
    "s3:DeleteBucket",
    "s3:DeleteBucketPolicy",
  ]
}
