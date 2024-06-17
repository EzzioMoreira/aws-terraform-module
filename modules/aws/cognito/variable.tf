variable "name" {
  description = "The name of the user pool"
  type        = string
}

variable "username_attributes" {
  description = "The attributes to be used as the username"
  type        = list(string)
  default     = ["email"]
}

variable "mfa_configuration" {
  description = "The MFA configuration for the user pool"
  type        = string
  default     = "OFF"
}

variable "recovery_mechanism" {
  description = "The recovery mechanism for the user pool"
  type = object({
    name     = string
    priority = number
  })
  default = {
    name     = "verified_email"
    priority = 1
  }
}

variable "password_policy" {
  description = "The password policy for the user pool"
  type = object({
    minimum_length                   = number
    require_lowercase                = bool
    require_numbers                  = bool
    require_symbols                  = bool
    require_uppercase                = bool
    temporary_password_validity_days = number
  })
  default = {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 7
  }
}

variable "tags" {
  description = "The tags for the user pool"
  type        = map(string)
}

## resource server
variable "resource_server" {
  description = "The resource server configuration"
  type = list(object({
    identifier = string
    name       = string
    scopes = list(object({
      scope_name        = string
      scope_description = string
    }))
  }))
  default = [
    {
      identifier = "https://api.drcash.com.br"
      name       = "Dr.Cash API"
      scopes = [
        {
          scope_name        = "admin"
          scope_description = "Admin scope"
        },
        {
          scope_name        = "user"
          scope_description = "User scope"
        }
      ]
    }
  ]
}

## domain configuration
variable "domain" {
  description = "The domain configuration"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the certificate"
  type        = string
}

## app client configuration
variable "client" {
  description = "The app client configuration"
  type = list(object({
    name                          = string
    generate_secret               = optional(bool, true)
    refresh_token_validity        = optional(number, 30)
    prevent_user_existence_errors = optional(string, "LEGACY")
    scopes                        = optional(list(string), [])
    allowed_oauth_flows           = optional(list(string), ["client_credentials"])
    supported_identity_providers  = optional(list(string), ["COGNITO"])
    callback_urls                 = optional(list(string), ["http://localhost:3000"])
    read_attributes               = optional(list(string), ["email", "email_verified"])
    write_attributes              = optional(list(string), ["email"])
    explicit_auth_flows = optional(list(string), [
      "ALLOW_REFRESH_TOKEN_AUTH",
      "ALLOW_CUSTOM_AUTH",
      "ALLOW_USER_SRP_AUTH"
    ])
  }))
  default = [
    {
      name   = "Dr.Cash Admin API 2.0"
      scopes = ["user"]
    }
  ]
}
