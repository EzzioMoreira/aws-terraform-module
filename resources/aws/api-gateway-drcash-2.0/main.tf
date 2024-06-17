################################################################################
# API Gateway Module
################################################################################
module "api-gateway" {
  source = "github.com/terraform-aws-modules/terraform-aws-apigateway-v2.git?ref=v5.0.0"

  # API Gateway
  name                           = local.context[terraform.workspace].name
  description                    = local.context[terraform.workspace].description
  protocol_type                  = local.context[terraform.workspace].protocol_type
  fail_on_warnings               = false
  routes                         = local.routes
  create_routes_and_integrations = true
  # Domain Name
  domain_name                 = local.context[terraform.workspace].domain_name.domain
  subdomains                  = local.context[terraform.workspace].domain_name.subdomains
  create_domain_records       = true
  create_certificate          = false
  domain_name_certificate_arn = local.context[terraform.workspace].domain_name.certificate_arn

  # Authorizer(s)
  authorizers = {
    cognito = {
      authorizer_type  = "JWT"
      identity_sources = ["$request.header.Authorization"]
      name             = module.cognito.cognito_name
      jwt_configuration = {
        audience = module.cognito.cognito_client_id
        issuer   = "https://cognito-idp.us-east-1.amazonaws.com/${module.cognito.cognito_id}"
      }
    }
  }

  # VPC Link
  vpc_links = {
    local.context[terraform.workspace].name = {
      name               = local.context[terraform.workspace].name
      security_group_ids = [local.context[terraform.workspace].security_group_ids]
      subnet_ids         = data.aws_subnets.private.ids
    }
  }

  tags = local.tags
}
