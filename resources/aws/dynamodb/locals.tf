locals {
  tags = {
    Name          = "dynamodb-terraform-state-lock-table"
    env           = "production"
    service       = "terraform"
    team          = "infrastructure"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
