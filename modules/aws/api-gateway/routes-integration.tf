# Routes and integrations
resource "aws_apigatewayv2_route" "this" {
  for_each = { for k, v in var.integrations : k => v if var.create_routes_and_integrations }

  api_id    = aws_apigatewayv2_api.this.id
  route_key = each.key

  api_key_required                    = try(each.value.api_key_required, null)
  authorization_scopes                = try(split(",", each.value.authorization_scopes), null)
  authorization_type                  = try(each.value.authorization_type, "NONE")
  model_selection_expression          = try(each.value.model_selection_expression, null)
  operation_name                      = try(each.value.operation_name, null)
  route_response_selection_expression = try(each.value.route_response_selection_expression, null)
  target                              = "integrations/${aws_apigatewayv2_integration.this[each.key].id}"

  # Have been added to the docs. But is WEBSOCKET only(not yet supported)
  # request_models  = try(each.value.request_models, null)
}

resource "aws_apigatewayv2_integration" "this" {
  for_each = { for k, v in var.integrations : k => v if var.create_routes_and_integrations }

  api_id      = aws_apigatewayv2_api.this.id
  description = try(each.value.description, null)

  integration_type    = try(each.value.integration_type, try(each.value.lambda_arn, "") != "" ? "AWS_PROXY" : "MOCK")
  integration_subtype = try(each.value.integration_subtype, null)
  integration_method  = try(each.value.integration_method, try(each.value.integration_subtype, null) == null ? "POST" : null)
  integration_uri     = try(each.value.lambda_arn, try(each.value.integration_uri, null))

  connection_type = try(each.value.connection_type, "INTERNET")
  connection_id   = try(aws_apigatewayv2_vpc_link.this[each.value["vpc_link"]].id, try(each.value.connection_id, null))

  payload_format_version    = try(each.value.payload_format_version, null)
  timeout_milliseconds      = try(each.value.timeout_milliseconds, null)
  passthrough_behavior      = try(each.value.passthrough_behavior, null)
  content_handling_strategy = try(each.value.content_handling_strategy, null)
  credentials_arn           = try(each.value.credentials_arn, null)
  request_parameters        = try(jsondecode(each.value["request_parameters"]), each.value["request_parameters"], null)

  dynamic "tls_config" {
    for_each = flatten([try(jsondecode(each.value["tls_config"]), each.value["tls_config"], [])])

    content {
      server_name_to_verify = tls_config.value["server_name_to_verify"]
    }
  }

  dynamic "response_parameters" {
    for_each = flatten([try(jsondecode(each.value["response_parameters"]), each.value["response_parameters"], [])])

    content {
      status_code = response_parameters.value["status_code"]
      mappings    = response_parameters.value["mappings"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
