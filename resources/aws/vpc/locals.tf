locals {
  environment = {
    default     = {}
    development = {}
    homolog     = {}
    production = {
      vpc_cidr = "10.10.0.0/16"
      subnets = {
        subnet_1 = {
          cidr = ""
          az   = "us-east-1a"
          public_ip = true
        }
        subnet_2 = {
          cidr = ""
          az   = "us-east-1b"
          public_ip = true
        }
        subnet_3 = {
          cidr = ""
          az   = "us-east-1c"
          public_ip = true
        }
      }
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
