module "ecr-rapadura" {
  source   = "github.com/rapadura-brazil/rapadura_platform_infrastructure.git//modules/aws/ecr?ref=v0.2.5-s3"
  for_each = toset(local.repositories)
  name     = each.value

  tags = {
    env           = "production"
    service       = each.value
    team          = "devops"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}