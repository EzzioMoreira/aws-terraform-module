module "database-rds-drcash2" {
  source               = "../../../modules/aws/rds"
  rds_name             = local.rds_name
  engine_version       = local.engine_version
  vpc_id               = data.aws_vpc.this.id
  parameter_group_name = local.parameter_group_name

  ingress_security_group_rules = [
    {
      description = "Allow Grafana Web to connect to RDS"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
    }
  ]

  tags = local.tags
}
