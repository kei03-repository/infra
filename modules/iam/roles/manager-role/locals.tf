locals {
  role_name = var.role_name

  # 許可するアクション（ワイルドカード）
  terraform_allowed_actions = [
    # EC2
    "ec2:*",
    # RDS
    "rds:*",
    # ALB/ELB
    "elasticloadbalancing:*",
    # DynamoDB
    "dynamodb:*",
    # Lambda
    "lambda:*",
    # CloudWatch
    "cloudwatch:*",
    "logs:*",
    # S3
    "s3:*",
    # CodeCommit
    "codecommit:*",
    # CodeBuild
    "codebuild:*",
    # CodeDeploy
    "codedeploy:*",
    # CodePipeline
    "codepipeline:*",
    # SNS
    "sns:*",
    # SQS
    "sqs:*",
    # API Gateway
    "apigateway:*",
    # CloudFront
    "cloudfront:*",
    # Route53
    "route53:*",
    # AutoScaling
    "autoscaling:*",
    # Application Auto Scaling
    "application-autoscaling:*",
    # ElastiCache
    "elasticache:*",
    # STS（AssumeRole 不可）
    "sts:GetCallerIdentity",
    # リソースタグ付け
    "tag:*",
    # 追加の補助サービス
    "resourcegroupstaggingapi:*",
    "ssm:GetParameter",
    "ssm:GetParameters",
    "ssm:GetParametersByPath",
    "ssm:DescribeParameters",
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
    # ECS（削除・変更）
    "ecs:UpdateService",
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
