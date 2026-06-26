resource "aws_lb" "this" {
  name               = substr("${var.name_prefix}-alb", 0, 32)
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.subnet_ids
  tags               = merge(var.tags, { Name = "${var.name_prefix}-alb" })
}

resource "aws_lb_target_group" "this" {
  name        = substr("${var.name_prefix}-tg", 0, 32)
  port        = var.target_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path    = var.health_check_path
    matcher = "200-399"
  }

  tags = merge(var.tags, { Name = "${var.name_prefix}-tg" })
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
