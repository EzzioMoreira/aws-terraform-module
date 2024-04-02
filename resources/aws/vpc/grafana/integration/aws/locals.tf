locals {
  grafana_account_id = "008923505280"
  external_id        = "1439419"

  tags = {
    name          = var.iam_role_name
    env           = "production"
    service       = "platform-infraestructure"
    team          = "infraestrutura"
    project       = "platform-infraestructure"
    repository    = "https://bitbucket.org/drcash/drcash_platform_infrastructure"
    documentation = "n/a"
    created       = "terraform"
  }
}
