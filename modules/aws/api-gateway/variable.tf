variable "name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "description" {
  description = "The description of the API Gateway"
  type        = string
}

variable "api_version" {
  description = "The version of the API Gateway"
  type        = string
  default     = null
}

variable "body" {
  description = "An OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs."
  type        = string
  default     = null
}

variable "route_selection_expression" {
  description = "The route selection expression for the API."
  type        = string
  default     = "$request.method $request.path"
}

variable "protocol_type" {
  description = "The protocol type of the API Gateway"
  type        = string
}

variable "api_key_selection_expression" {
  description = "An API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key."
  type        = string
  default     = "$request.header.x-api-key"
}

variable "cors_configuration" {
  description = "The cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs."
  type        = any
  default     = {}
}

variable "fail_on_warnings" {
  description = "Whether warnings should return an error while API Gateway is creating or updating the resource using an OpenAPI specification. Defaults to false. Applicable for HTTP APIs."
  type        = bool
  default     = false
}

variable "disable_execute_api_endpoint" {
  description = "Whether clients can invoke the API by using the default execute-api endpoint. To require that clients use a custom domain name to invoke the API, disable the default endpoint"
  type        = string
  default     = false
}


variable "vpc_links" {
  description = "VPC Links for Private APIs"
  type = map(object({
    security_group_ids = optional(list(string), [])
    subnet_ids         = list(string)
    tags               = map(string)
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

variable "vpc_link_tags" {
  description = "Tags to apply to VPC Links"
  type        = map(string)
  default     = {}
}

variable "create_api_domain_name" {
  description = "Whether to create a domain name for the API Gateway"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "The domain name for the API Gateway"
  type        = string
  default     = null
}

variable "mutual_tls_authentication" {
  description = "The mutual TLS authentication configuration for a custom domain name"
  type        = map(string)
  default     = {}
}

variable "domain_name_tags" {
  description = "Tags to apply to the domain name"
  type        = map(string)
  default     = {}
}
