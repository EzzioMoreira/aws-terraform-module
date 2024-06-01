resource "aws_lb" "this" {
  name               = "alb-ecs-cluster-${var.name}"
  internal           = var.internal
  load_balancer_type = var.type

  security_groups = var.security_group_ids
  subnets         = var.subnet_ids
  tags            = var.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:852704159394:certificate/d40fd5a3-353e-4334-8b67-39b5d9f62a95"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_certificate" "this" {
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = "arn:aws:acm:us-east-1:852704159394:certificate/7f387fe9-ade8-45cd-b4d0-6d2c54deac39"
}
