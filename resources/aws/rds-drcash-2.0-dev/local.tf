locals {
  rds_name                = "db-rapadura-shared-development"
  engine_version          = "16.2"
  parameter_group_name    = "default.postgres16"
  publicly_accessible_rds = true

  tags = {
    env           = "development"
    service       = "rapadura2.0"
    team          = "devops"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
