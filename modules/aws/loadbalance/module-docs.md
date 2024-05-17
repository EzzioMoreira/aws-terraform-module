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
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internal"></a> [internal](#input\_internal) | value of the load balancer internal or external flag | `bool` | `true` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | value of the listeners associated with the load balancer | <pre>map(object({<br>    port                     = string<br>    protocol                 = string<br>    default_target_group_arn = string<br>    ssl_policy               = optional(string)<br>    certificate_arn          = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | value of the load balancer name | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | value of the security group ids associated with the load balancer | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | value of the subnet ids associated with the load balancer | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags to apply to the load balancer | `map(string)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | value of the load balancer type | `string` | `"application"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | n/a |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | n/a |
| <a name="output_listener_arns"></a> [listener\_arns](#output\_listener\_arns) | n/a |
| <a name="output_load_balance_zone_id"></a> [load\_balance\_zone\_id](#output\_load\_balance\_zone\_id) | n/a |
