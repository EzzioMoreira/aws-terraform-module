resource "aws_security_group" "this" {
  name        = "${local.cluster_name}-ecs-node-sg"
  description = "ECS Node Security Group ${local.cluster_name}"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.tags
}
