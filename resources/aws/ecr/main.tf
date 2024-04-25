module "ecr-drcash" {
  source   = "../../../modules/aws/ecr"
  for_each = toset(local.repositories)
  name     = each.value

  tags = {
    env           = "production"
    service       = each.value
    team          = "devops"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}