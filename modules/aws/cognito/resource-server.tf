resource "aws_cognito_resource_server" "resource_server" {
  for_each     = { for idx, server in var.resource_server : idx => server }
  identifier   = each.value.identifier
  name         = each.value.name
  user_pool_id = aws_cognito_user_pool.this.id

  dynamic "scope" {
    for_each = try(each.value.scopes, [])

    content {
      scope_name        = scope.value.scope_name
      scope_description = scope.value.scope_description
    }
  }
}
