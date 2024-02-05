locals {
  environment = {
    default     = {}
    development = {}
    homolog     = {}
    production = {
      vpc_cidr = "10.10.0.0/16"
    }
  }
  tags = {
    name          = "vpc-${terraform.workspace}"
    env           = terraform.workspace
    service       = "platform-infraestructure"
    team          = "infraestrutura"
    project       = "platform-infraestructure"
    repository    = "https://bitbucket.org/drcash/drcash_platform_infrastructure"
    documentation = "n/a"
    created       = "terraform"
  }
}
