output "apigateway_domain_name" {
  value       = aws_apigatewayv2_domain_name.this[0].domain_name_configuration[0].target_domain_name
  description = "value of apigateway_domain_name"
}

output "apigateway_hosted_zone_id" {
  value       = aws_apigatewayv2_domain_name.this[0].domain_name_configuration[0].hosted_zone_id
  description = "value of apigateway_hosted_zone_id"
}