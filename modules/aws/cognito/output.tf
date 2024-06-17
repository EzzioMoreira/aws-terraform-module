output "cognito_domain" {
  description = "value of cognito domain"
  value       = aws_cognito_user_pool_domain.this.domain
}

output "cognito_name" {
  description = "value of cognito client id"
  value       = aws_cognito_user_pool.this.name
}

output "cognito_id" {
  description = "value of cognito id"
  value       = aws_cognito_user_pool.this.id
}

output "cognito_client_id" {
  description = "List of Cognito client IDs"
  value       = [for client in aws_cognito_user_pool_client.client : client.id]
}


output "clients_app_integration" {
  description = "List of app integrations"
  value = [for client in aws_cognito_user_pool_client.client : {
    name = client.name
    id   = client.id
  }]
}
