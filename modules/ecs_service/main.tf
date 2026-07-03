resource "aws_ecs_service" "this" {
  name            = "${var.environment}--${var.product_name}--${var.service_name}--sv"
  cluster         = var.cluster_arn
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.security_group_id]
    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  tags = {
    Name        = "${var.environment}--${var.product_name}--${var.service_name}--sv"
    ProductName = var.product_name
  }
}