resource "aws_db_instance" "this" {
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = true
  publicly_accessible    = false
  tags                   = var.tags
}
