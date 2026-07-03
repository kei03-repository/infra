resource "aws_ecs_task_definition" "this" {
  family                   = "${var.environment}--${var.product_name}--${var.task_definition_name}--td"
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
  container_definitions    = var.container_definitions

  tags = {
    Name        = "${var.environment}--${var.product_name}--${var.task_definition_name}--td"
    ProductName = var.product_name
  }
}