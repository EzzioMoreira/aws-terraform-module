resource "aws_security_group" "this" {
  name        = "${module.ecs_cluster_development.ecs_cluster.cluster_name}-sg"
  description = "Allow http, https inbound and all outbound traffic"
  vpc_id      = module.ecs_cluster_development.vpc_id

  tags = local.tags

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.this.id
}
