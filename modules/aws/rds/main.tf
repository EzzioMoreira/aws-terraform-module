resource "aws_db_instance" "this" {
  allocated_storage                     = var.storage
  storage_type                          = var.storage_type
  engine                                = var.engine
  engine_version                        = var.engine_version
  multi_az                              = var.multi_az
  instance_class                        = var.instance_type
  db_name                               = var.db_name
  username                              = var.db_username
  password                              = random_password.this.result
  port                                  = var.port
  backup_retention_period               = var.backup_retention
  db_subnet_group_name                  = aws_db_subnet_group.this.name
  vpc_security_group_ids                = [aws_security_group.this.id]
  identifier                            = var.rds_name
  parameter_group_name                  = var.parameter_group_name
  skip_final_snapshot                   = var.snapshot
  publicly_accessible                   = var.publicly_accessible_rds
  tags                                  = var.tags
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  copy_tags_to_snapshot                 = true
}
