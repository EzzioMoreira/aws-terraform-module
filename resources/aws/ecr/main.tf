module "ecr-drcash" {
  source   = "github.com/drcash-brazil/drcash_platform_infrastructure.git//modules/aws/ecr?ref=v0.2.5-s3"
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