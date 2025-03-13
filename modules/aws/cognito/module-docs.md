## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_resource_server.resource_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_resource_server) | resource |
| [aws_cognito_user_pool.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |
| [aws_cognito_user_pool_client.client](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client) | resource |
| [aws_cognito_user_pool_domain.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The ARN of the certificate | `string` | n/a | yes |
| <a name="input_client"></a> [client](#input\_client) | The app client configuration | <pre>list(object({<br>    name                          = string<br>    generate_secret               = optional(bool, true)<br>    refresh_token_validity        = optional(number, 30)<br>    prevent_user_existence_errors = optional(string, "LEGACY")<br>    scopes                        = optional(list(string), [])<br>    allowed_oauth_flows           = optional(list(string), ["client_credentials"])<br>    supported_identity_providers  = optional(list(string), ["COGNITO"])<br>    callback_urls                 = optional(list(string), ["http://localhost:3000"])<br>    read_attributes               = optional(list(string), ["email", "email_verified"])<br>    write_attributes              = optional(list(string), ["email"])<br>    explicit_auth_flows = optional(list(string), [<br>      "ALLOW_REFRESH_TOKEN_AUTH",<br>      "ALLOW_CUSTOM_AUTH",<br>      "ALLOW_USER_SRP_AUTH"<br>    ])<br>  }))</pre> | <pre>[<br>  {<br>    "name": "rapadura Admin API 2.0",<br>    "scopes": [<br>      "user"<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain configuration | `string` | n/a | yes |
| <a name="input_mfa_configuration"></a> [mfa\_configuration](#input\_mfa\_configuration) | The MFA configuration for the user pool | `string` | `"OFF"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the user pool | `string` | n/a | yes |
| <a name="input_password_policy"></a> [password\_policy](#input\_password\_policy) | The password policy for the user pool | <pre>object({<br>    minimum_length                   = number<br>    require_lowercase                = bool<br>    require_numbers                  = bool<br>    require_symbols                  = bool<br>    require_uppercase                = bool<br>    temporary_password_validity_days = number<br>  })</pre> | <pre>{<br>  "minimum_length": 8,<br>  "require_lowercase": true,<br>  "require_numbers": true,<br>  "require_symbols": true,<br>  "require_uppercase": true,<br>  "temporary_password_validity_days": 7<br>}</pre> | no |
| <a name="input_recovery_mechanism"></a> [recovery\_mechanism](#input\_recovery\_mechanism) | The recovery mechanism for the user pool | <pre>object({<br>    name     = string<br>    priority = number<br>  })</pre> | <pre>{<br>  "name": "verified_email",<br>  "priority": 1<br>}</pre> | no |
| <a name="input_resource_server"></a> [resource\_server](#input\_resource\_server) | The resource server configuration | <pre>list(object({<br>    identifier = string<br>    name       = string<br>    scopes = list(object({<br>      scope_name        = string<br>      scope_description = string<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "identifier": "https://api.rapadura.com.br",<br>    "name": "rapadura API",<br>    "scopes": [<br>      {<br>        "scope_description": "Admin scope",<br>        "scope_name": "admin"<br>      },<br>      {<br>        "scope_description": "User scope",<br>        "scope_name": "user"<br>      }<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags for the user pool | `map(string)` | n/a | yes |
| <a name="input_username_attributes"></a> [username\_attributes](#input\_username\_attributes) | The attributes to be used as the username | `list(string)` | <pre>[<br>  "email"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clients_app_integration"></a> [clients\_app\_integration](#output\_clients\_app\_integration) | List of app integrations |
| <a name="output_cognito_client_id"></a> [cognito\_client\_id](#output\_cognito\_client\_id) | List of Cognito client IDs |
| <a name="output_cognito_domain"></a> [cognito\_domain](#output\_cognito\_domain) | value of cognito domain |
| <a name="output_cognito_id"></a> [cognito\_id](#output\_cognito\_id) | value of cognito id |
| <a name="output_cognito_name"></a> [cognito\_name](#output\_cognito\_name) | value of cognito client id |
