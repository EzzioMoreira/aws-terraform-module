resource "aws_security_group" "this" {
  name   = "rds-${var.db_name}-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_security_group_rule" "this" {
  for_each = { for rule in var.ingress_security_group_rules : rule.from_port => rule }

  security_group_id = aws_security_group.this.id
  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  description       = each.value.description
  cidr_blocks       = [data.aws_vpc.this.cidr_block]
}
