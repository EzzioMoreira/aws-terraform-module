resource "aws_security_group" "this" {
  name        = "${local.cluster_name}-ecs-node-sg"
  description = "ECS Node Security Group ${local.cluster_name}"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.tags
}

resource "aws_security_group_rule" "allow_all" {
  description       = "Allow https traffic"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
}
