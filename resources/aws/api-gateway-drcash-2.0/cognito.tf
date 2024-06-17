module "cognito" {
  source          = "../../../modules/aws/cognito"
  name            = local.context[terraform.workspace].name
  domain          = local.context[terraform.workspace].cognito_domain.domain
  certificate_arn = local.context[terraform.workspace].cognito_domain.certificate_arn
  resource_server = local.resource_server
  client          = local.context[terraform.workspace].client

  tags = local.tags
}