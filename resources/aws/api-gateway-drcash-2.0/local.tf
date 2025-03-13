locals {
  context = {
    development = {
      name               = "Plug-Play-DEV"
      description        = "API Gateway for services rapadura 2.0 environment DEV"
      protocol_type      = "HTTP"
      security_group_ids = "sg-0a8bb52784a0c8786"

      client = [
        {
          name   = "Admin APIs rapadura 2.0"
          scopes = ["clinics/admin"]
        },
        {
          name   = "QA APIs rapadura API 2.0"
          scopes = ["clinics/admin"]
        }
      ]

      cognito_domain = {
        domain          = "auth.dev.rapadura.com.br"
        certificate_arn = "arn:aws:acm:us-east-1:852704159394:certificate/7f387fe9-ade8-45cd-b4d0-6d2c54deac39"
      }

      domain_name = {
        domain          = "*.rapadura.com.br"
        subdomains      = ["dev"] # Subdomínios que será criado no route53 dev.rapadura.com.br
        certificate_arn = "arn:aws:acm:us-east-1:852704159394:certificate/d40fd5a3-353e-4334-8b67-39b5d9f62a95"
      }
    }

    staging = {}

    production = {}
  }
  tags = {
    env           = "${terraform.workspace}"
    service       = "api-gateway"
    product       = "rapadura2.0"
    project       = "${local.context[terraform.workspace].name}"
    team          = "devops"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}
