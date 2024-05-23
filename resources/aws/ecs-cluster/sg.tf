resource "aws_security_group" "this" {
  name        = "${module.ecs_cluster_development.ecs_cluster.cluster_name}-sg"
  description = "Allow http, https inbound and all outbound traffic"
  vpc_id      = module.ecs_cluster_development.vpc_id

  tags = local.tags

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

