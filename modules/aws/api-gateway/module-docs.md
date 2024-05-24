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
| [aws_apigatewayv2_api.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_apigatewayv2_api_mapping.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api_mapping) | resource |
| [aws_apigatewayv2_domain_name.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_domain_name) | resource |
| [aws_apigatewayv2_integration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) | resource |
| [aws_apigatewayv2_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) | resource |
| [aws_apigatewayv2_stage.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) | resource |
| [aws_apigatewayv2_vpc_link.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_vpc_link) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_acm_certificate.issued](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_selection_expression"></a> [api\_key\_selection\_expression](#input\_api\_key\_selection\_expression) | An API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key. | `string` | `"$request.header.x-api-key"` | no |
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | The version of the API Gateway | `string` | `null` | no |
| <a name="input_body"></a> [body](#input\_body) | An OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs. | `string` | `null` | no |
| <a name="input_cors_configuration"></a> [cors\_configuration](#input\_cors\_configuration) | The cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs. | `any` | `{}` | no |
| <a name="input_create_api_domain_name"></a> [create\_api\_domain\_name](#input\_create\_api\_domain\_name) | Whether to create a domain name for the API Gateway | `bool` | `false` | no |
| <a name="input_create_default_stage"></a> [create\_default\_stage](#input\_create\_default\_stage) | Whether to create default stage | `bool` | `true` | no |
| <a name="input_create_default_stage_access_log_group"></a> [create\_default\_stage\_access\_log\_group](#input\_create\_default\_stage\_access\_log\_group) | Create the cloud watch log group | `bool` | `false` | no |
| <a name="input_create_default_stage_api_mapping"></a> [create\_default\_stage\_api\_mapping](#input\_create\_default\_stage\_api\_mapping) | Whether to create default stage API mapping | `bool` | `true` | no |
| <a name="input_create_routes_and_integrations"></a> [create\_routes\_and\_integrations](#input\_create\_routes\_and\_integrations) | Whether to create routes and integrations resources | `bool` | `true` | no |
| <a name="input_default_route_settings"></a> [default\_route\_settings](#input\_default\_route\_settings) | Settings for default route | `map(string)` | `{}` | no |
| <a name="input_default_stage_access_log_destination_arn"></a> [default\_stage\_access\_log\_destination\_arn](#input\_default\_stage\_access\_log\_destination\_arn) | Default stage's ARN of the CloudWatch Logs log group to receive access logs. Any trailing :* is trimmed from the ARN. | `string` | `null` | no |
| <a name="input_default_stage_access_log_format"></a> [default\_stage\_access\_log\_format](#input\_default\_stage\_access\_log\_format) | Default stage's single line format of the access logs of data, as specified by selected $context variables. | `string` | `null` | no |
| <a name="input_default_stage_access_log_group_class"></a> [default\_stage\_access\_log\_group\_class](#input\_default\_stage\_access\_log\_group\_class) | Specified the log class of the Access log group. Possible values are: STANDARD or INFREQUENT\_ACCESS | `string` | `"INFREQUENT_ACCESS"` | no |
| <a name="input_default_stage_access_log_group_kms_key_id"></a> [default\_stage\_access\_log\_group\_kms\_key\_id](#input\_default\_stage\_access\_log\_group\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting log data for Access logs | `string` | `null` | no |
| <a name="input_default_stage_access_log_group_retention_in_days"></a> [default\_stage\_access\_log\_group\_retention\_in\_days](#input\_default\_stage\_access\_log\_group\_retention\_in\_days) | Specifies the number of the days retention logs | `number` | `7` | no |
| <a name="input_default_stage_access_log_group_skip_destroy"></a> [default\_stage\_access\_log\_group\_skip\_destroy](#input\_default\_stage\_access\_log\_group\_skip\_destroy) | Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state | `bool` | `false` | no |
| <a name="input_default_stage_access_log_group_tags"></a> [default\_stage\_access\_log\_group\_tags](#input\_default\_stage\_access\_log\_group\_tags) | Additional tags for the Access logs | `map(string)` | `{}` | no |
| <a name="input_default_stage_tags"></a> [default\_stage\_tags](#input\_default\_stage\_tags) | A mapping of tags to assign to the default stage resource. | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the API Gateway | `string` | n/a | yes |
| <a name="input_disable_execute_api_endpoint"></a> [disable\_execute\_api\_endpoint](#input\_disable\_execute\_api\_endpoint) | Whether clients can invoke the API by using the default execute-api endpoint. To require that clients use a custom domain name to invoke the API, disable the default endpoint | `string` | `false` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the API Gateway | `string` | `null` | no |
| <a name="input_domain_name_tags"></a> [domain\_name\_tags](#input\_domain\_name\_tags) | Tags to apply to the domain name | `map(string)` | `{}` | no |
| <a name="input_fail_on_warnings"></a> [fail\_on\_warnings](#input\_fail\_on\_warnings) | Whether warnings should return an error while API Gateway is creating or updating the resource using an OpenAPI specification. Defaults to false. Applicable for HTTP APIs. | `bool` | `false` | no |
| <a name="input_integrations"></a> [integrations](#input\_integrations) | Map of API gateway routes with integrations | `map(any)` | `{}` | no |
| <a name="input_mutual_tls_authentication"></a> [mutual\_tls\_authentication](#input\_mutual\_tls\_authentication) | The mutual TLS authentication configuration for a custom domain name | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the API Gateway | `string` | n/a | yes |
| <a name="input_protocol_type"></a> [protocol\_type](#input\_protocol\_type) | The protocol type of the API Gateway | `string` | n/a | yes |
| <a name="input_route_selection_expression"></a> [route\_selection\_expression](#input\_route\_selection\_expression) | The route selection expression for the API. | `string` | `"$request.method $request.path"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map(string)` | n/a | yes |
| <a name="input_vpc_link_tags"></a> [vpc\_link\_tags](#input\_vpc\_link\_tags) | Tags to apply to VPC Links | `map(string)` | `{}` | no |
| <a name="input_vpc_links"></a> [vpc\_links](#input\_vpc\_links) | VPC Links for Private APIs | <pre>map(object({<br>    security_group_ids = optional(list(string), [])<br>    subnet_ids         = list(string)<br>    tags               = map(string)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apigateway_domain_name"></a> [apigateway\_domain\_name](#output\_apigateway\_domain\_name) | value of apigateway\_domain\_name |
| <a name="output_apigateway_hosted_zone_id"></a> [apigateway\_hosted\_zone\_id](#output\_apigateway\_hosted\_zone\_id) | value of apigateway\_hosted\_zone\_id |
