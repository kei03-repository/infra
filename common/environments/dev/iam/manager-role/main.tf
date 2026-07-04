# manager-role モジュール呼び出し
module "manager_role" {
  source = "../../../../modules/iam/roles/manager-role"

  role_name                = "DEV-manager-role"
  assume_role_account_id   = var.assume_role_account_id

  tags = merge(
    {
      Name        = "DEV-manager-role"
      Environment = var.environment
    }
  )
}
