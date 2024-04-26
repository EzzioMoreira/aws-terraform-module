module "db_grafana" {
  source      = "../../modules/rds"
  db_name     = "grafana"
  db_username = "grafana"
  vpc_id      = "vpc-0b95a372313f6516d"

  tags = {
    env           = "prod"
    service       = "observability"
    team          = "sre"
    repository    = "ezziomoreira/aws-terraform-modules"
    documentation = "null"
    created_by    = "terraform"
  }
}