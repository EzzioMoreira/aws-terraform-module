# Default stage
resource "aws_apigatewayv2_stage" "default" {
  count = var.create_default_stage ? 1 : 0

  api_id      = aws_apigatewayv2_api.this.id
  name        = "$default"
  auto_deploy = true

  dynamic "access_log_settings" {
    for_each = (var.default_stage_access_log_destination_arn != null || var.create_default_stage_access_log_group) ? [true] : []

    content {
      destination_arn = try(aws_cloudwatch_log_group.this[0].arn, var.default_stage_access_log_destination_arn)
      format          = var.default_stage_access_log_format
    }
  }

  dynamic "default_route_settings" {
    for_each = length(keys(var.default_route_settings)) == 0 ? [] : [var.default_route_settings]

    content {
      data_trace_enabled = try(default_route_settings.value.data_trace_enabled, false) # supported in Websocket APIGateway only
      logging_level      = try(default_route_settings.value.logging_level, null)       # supported in Websocket APIGateway only

      detailed_metrics_enabled = try(default_route_settings.value.detailed_metrics_enabled, false)
      throttling_burst_limit   = try(default_route_settings.value.throttling_burst_limit, null)
      throttling_rate_limit    = try(default_route_settings.value.throttling_rate_limit, null)
    }
  }

  dynamic "route_settings" {
    for_each = { for k, v in var.integrations : k => v if var.create_routes_and_integrations && try(tobool(v.create_route), true) && length(setintersection(["data_trace_enabled", "detailed_metrics_enabled", "logging_level", "throttling_burst_limit", "throttling_rate_limit"], keys(v))) > 0 }

    content {
      route_key          = route_settings.key
      data_trace_enabled = try(route_settings.value.data_trace_enabled, var.default_route_settings["data_trace_enabled"], false) # supported in Websocket APIGateway only
      logging_level      = try(route_settings.value.logging_level, var.default_route_settings["logging_level"], null)            # supported in Websocket APIGateway only

      detailed_metrics_enabled = try(route_settings.value.detailed_metrics_enabled, var.default_route_settings["detailed_metrics_enabled"], false)
      throttling_burst_limit   = try(route_settings.value.throttling_burst_limit, var.default_route_settings["throttling_burst_limit"], null)
      throttling_rate_limit    = try(route_settings.value.throttling_rate_limit, var.default_route_settings["throttling_rate_limit"], null)
    }
  }

  tags = merge(var.default_stage_tags, var.tags)

  # Bug in terraform-aws-provider with perpetual diff
  lifecycle {
    ignore_changes = [deployment_id]
  }

  depends_on = [aws_apigatewayv2_integration.this]
}

# Default API mapping
resource "aws_apigatewayv2_api_mapping" "this" {
  count = var.create_api_domain_name && var.create_default_stage && var.create_default_stage_api_mapping ? 1 : 0

  api_id      = aws_apigatewayv2_api.this.id
  domain_name = aws_apigatewayv2_domain_name.this.id
  stage       = aws_apigatewayv2_stage.default[0].id
}
