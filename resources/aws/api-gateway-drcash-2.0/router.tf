locals {
  authorizer_key     = "cognito"
  authorization_type = "JWT"
  default_integration = {
    connection_type = "VPC_LINK"
    uri             = data.terraform_remote_state.ecs_cluster_dev.outputs.loadbalance.private.lb_listener_http.arn
    type            = "HTTP_PROXY"
    vpc_link_key    = local.context[terraform.workspace].name
  }

  # Função para recuperar todas as rotas YAML em todos os subdiretórios de ./services
  all_routes_yaml = fileset("${path.module}/services/", "*/*.yaml")

  # Função para carregar rotas dos arquivos YAML e mesclar com os valores padrão
  load_routes = flatten([
    for route_file in local.all_routes_yaml : [
      for route in yamldecode(file("${path.module}/services/${route_file}")).routes : {
        "${route.method} ${route.path}" = {
          authorizer_key     = lookup(route, "authorizer_id", local.authorizer_key)
          authorization_type = lookup(route, "authorization_type", local.authorization_type)
          integration = {
            connection_type = lookup(route, "connection_type", local.default_integration.connection_type)
            uri             = lookup(route, "uri", local.default_integration.uri)
            type            = lookup(route, "type", local.default_integration.type)
            vpc_link_key    = lookup(route, "vpc_link_key", local.default_integration.vpc_link_key)
            method          = route.method
          }
        }
      }
    ]
  ])

  # Convertendo a lista de mapas em um único mapa
  routes = { for r in local.load_routes : keys(r)[0] => values(r)[0] }
}

# verificar mais opões das rotas:
# route_settings {
#   + data_trace_enabled       = false
#   + detailed_metrics_enabled = true
#   + logging_level            = (known after apply)
#   + route_key                = "GET /clinics/api/v1/sub-status/status-type/{statusTypeId}"
#   + throttling_burst_limit   = 500
#   + throttling_rate_limit    = 1000