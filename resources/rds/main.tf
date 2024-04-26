module "db_grafana" {
  source      = "github.com/EzzioMoreira/aws-terraform-module//modules/rds?ref=v0.0.2-rds"
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