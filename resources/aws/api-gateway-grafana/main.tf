module "api-gateway-grafana" {
  source = "../../../modules/aws/api-gateway"

  name                   = "grafana-web"
  description            = "API Gateway for Grafana Web"
  protocol_type          = "HTTP"
  create_api_domain_name = true
  domain_name            = "grafana-web.drcash.com.br"

  vpc_links = {
    grafana-web = {
      subnet_ids = data.aws_subnets.private.ids
      tags       = local.tags
    }
  }

  tags = local.tags
}
