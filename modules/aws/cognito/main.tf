resource "aws_cognito_user_pool" "this" {
  name                     = var.name
  mfa_configuration        = var.mfa_configuration
  username_attributes      = var.username_attributes
  auto_verified_attributes = var.username_attributes

  password_policy {
    minimum_length                   = var.password_policy.minimum_length
    require_lowercase                = var.password_policy.require_lowercase
    require_numbers                  = var.password_policy.require_numbers
    require_symbols                  = var.password_policy.require_symbols
    require_uppercase                = var.password_policy.require_uppercase
    temporary_password_validity_days = var.password_policy.temporary_password_validity_days
  }

  account_recovery_setting {
    recovery_mechanism {
      name     = var.recovery_mechanism.name
      priority = var.recovery_mechanism.priority
    }
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject        = "Account Confirmation"
    email_message        = "Your confirmation code is {####}"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }

  tags = var.tags
}

resource "aws_cognito_user_pool_client" "client" {
  # bug: https://github.com/hashicorp/terraform-provider-aws/issues/34945
  # Após criar app integrations, o terraform não consegue mais atualizar o client.
  # Para resolver, é necessário editar Hosted UI e clicar em salvar sem alterar nenhuma opção.
  for_each                      = { for idx, client in var.client : idx => client }
  name                          = each.value.name
  user_pool_id                  = aws_cognito_user_pool.this.id
  generate_secret               = each.value.generate_secret
  refresh_token_validity        = each.value.refresh_token_validity
  prevent_user_existence_errors = each.value.prevent_user_existence_errors
  callback_urls                 = each.value.callback_urls
  read_attributes               = each.value.read_attributes
  write_attributes              = each.value.write_attributes
  allowed_oauth_scopes          = each.value.scopes
  allowed_oauth_flows           = each.value.allowed_oauth_flows
  supported_identity_providers  = each.value.supported_identity_providers
  explicit_auth_flows           = each.value.explicit_auth_flows
}

resource "aws_cognito_user_pool_domain" "this" {
  domain          = var.domain
  certificate_arn = var.certificate_arn
  user_pool_id    = aws_cognito_user_pool.this.id
}
