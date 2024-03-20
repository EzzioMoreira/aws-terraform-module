locals {
  tags = {
    Name          = "dynamodb-terraform-state-lock-table"
    env           = "production"
    service       = "terraform"
    team          = "infrastructure"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
