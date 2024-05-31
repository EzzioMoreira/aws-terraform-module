locals {
  rds_name                = "db-drcash-shared-development"
  engine_version          = "16.2"
  parameter_group_name    = "default.postgres16"
  publicly_accessible_rds = true

  tags = {
    env           = "development"
    service       = "drcash2.0"
    team          = "devops"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
