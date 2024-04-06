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
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | value for assign\_public\_ip | `bool` | `false` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ID do cluster | `string` | n/a | yes |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | values for container\_definitions | <pre>map(<br>    object({<br>      name   = string<br>      image  = string<br>      cpu    = optional(string, "0.5") # 0.5 vCPU<br>      memory = optional(string, "512") # 512 MiB<br>      port_mappings = list(object({<br>        container_port = optional(number, 80)<br>        host_port      = optional(number, 80)<br>        protocol       = optional(string, "tcp")<br>      }))<br>      essential = optional(bool, true)<br>      environment_variables = optional(list(object({<br>        name  = string<br>        value = string<br>      })), [])<br><br>      secrets = optional(list(object({<br>        name      = string<br>        valueFrom = string<br>      })), [])<br><br>      health_check = object({<br>        command     = list(string)<br>        retries     = optional(number, 5)<br>        timeout     = optional(number, 10)<br>        interval    = optional(number, 5)<br>        startPeriod = optional(number, 30)<br>        }<br>      )<br>      expose = optional(bool, false)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | value for desired\_count | `number` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | value for execution\_role\_arn | `string` | `""` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | values for load\_balancer | <pre>object({<br>    target_group_arn = string<br>    container_name   = string<br>    container_port   = number<br>  })</pre> | `null` | no |
| <a name="input_log_group"></a> [log\_group](#input\_log\_group) | Time retention in dyas to log groups | `number` | `7` | no |
| <a name="input_name"></a> [name](#input\_name) | value for name | `string` | n/a | yes |
| <a name="input_resources"></a> [resources](#input\_resources) | values for resources in task\_definition | <pre>object({<br>    cpu    = number<br>    memory = number<br>  })</pre> | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | value for security\_groups | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | value for subnets | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags to apply to the ECS cluster | `map(string)` | <pre>{<br>  "AmazonECSManaged": "true",<br>  "created": "",<br>  "documentation": "",<br>  "env": "",<br>  "repository": "",<br>  "service": "",<br>  "team": ""<br>}</pre> | no |

## Outputs

No outputs.
