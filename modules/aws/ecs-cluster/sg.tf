resource "aws_security_group" "this" {
  name        = "ec2-template-ecs-cluster-${var.cluster_name}"
  description = "Security group for template ECS cluster ${var.cluster_name}"
  vpc_id      = var.vpc_id

  tags = var.tags

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
