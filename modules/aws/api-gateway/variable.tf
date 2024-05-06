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

# Variable Log Gourp 
variable "create_default_stage_access_log_group" {
  description = "Create the cloud watch log group"
  type        = bool
  default     = false
}

variable "default_stage_access_log_group_retention_in_days" {
  description = "Specifies the number of the days retention logs"
  type        = number
  default     = 7
}

variable "default_stage_access_log_group_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data for Access logs"
  type        = string
  default     = null
}

variable "default_stage_access_log_group_skip_destroy" {
  description = "Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state"
  type        = bool
  default     = false
}

variable "default_stage_access_log_group_class" {
  description = "Specified the log class of the Access log group. Possible values are: STANDARD or INFREQUENT_ACCESS"
  type        = string
  default     = "INFREQUENT_ACCESS"
  validation {
    condition     = contains(["STANDARD", "INFREQUENT_ACCESS"], var.default_stage_access_log_group_class)
    error_message = "The stage access log must be 'STANDARD' or 'INFREQUENT_ACCESS'"
  }
}

variable "default_stage_access_log_group_tags" {
  description = "Additional tags for the Access logs"
  type        = map(string)
  default     = {}
}

# Variable Stage

variable "create_default_stage" {
  description = "Whether to create default stage"
  type        = bool
  default     = true
}

variable "default_stage_access_log_destination_arn" {
  description = "Default stage's ARN of the CloudWatch Logs log group to receive access logs. Any trailing :* is trimmed from the ARN."
  type        = string
  default     = null
}

variable "default_stage_access_log_format" {
  description = "Default stage's single line format of the access logs of data, as specified by selected $context variables."
  type        = string
  default     = null
}

variable "default_route_settings" {
  description = "Settings for default route"
  type        = map(string)
  default     = {}
}

variable "create_routes_and_integrations" {
  description = "Whether to create routes and integrations resources"
  type        = bool
  default     = true
}

# routes and integrations
variable "integrations" {
  description = "Map of API gateway routes with integrations"
  type        = map(any)
  default     = {}
}

variable "default_stage_tags" {
  description = "A mapping of tags to assign to the default stage resource."
  type        = map(string)
  default     = {}
}

variable "create_default_stage_api_mapping" {
  description = "Whether to create default stage API mapping"
  type        = bool
  default     = true
}
