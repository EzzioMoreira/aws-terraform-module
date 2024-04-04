resource "aws_lb" "this" {
  name               = "alb-ecs-cluster-${var.name}"
  internal           = var.internal
  load_balancer_type = var.type

  security_groups = var.security_group_ids
  subnets         = var.subnet_ids
  tags            = var.tags
}

resource "aws_lb_listener" "this" {
  for_each = var.listeners

  load_balancer_arn = aws_lb.this.arn
  port              = each.value.port
  protocol          = each.value.protocol

  default_action {
    type             = "forward"
    target_group_arn = each.value.default_target_group_arn
  }
}
