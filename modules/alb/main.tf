resource "aws_lb" "this" {
  name               = substr("${var.environment}--${var.product_name}--alb", 0, 32)
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.subnet_ids
  tags               = {
    Name        = "${var.environment}--${var.product_name}--alb"
    ProductName = var.product_name
  }
}

resource "aws_lb_target_group" "this" {
  name               = substr("${var.environment}-${var.product_name}-${var.deployment_color}-tg", 0, 32)
  port               = var.target_port
  protocol           = "HTTP"
  target_type        = "ip"
  vpc_id             = var.vpc_id

  health_check {
    path        = var.health_check_path
    matcher     = "200-399"
  }

  tags = {
    Name        = "${var.environment}-${var.product_name}-${var.deployment_color}-tg"
    ProductName = var.product_name
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
