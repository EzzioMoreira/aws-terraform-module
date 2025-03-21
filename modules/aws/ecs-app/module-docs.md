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
| [aws_appautoscaling_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | value for assign\_public\_ip | `bool` | `false` | no |
| <a name="input_autoscaling_app"></a> [autoscaling\_app](#input\_autoscaling\_app) | The autoscaling configuration for the service | <pre>object({<br>    min_capacity = number<br>    max_capacity = number<br>    target       = number<br>  })</pre> | <pre>{<br>  "max_capacity": 2,<br>  "min_capacity": 1,<br>  "target": 80<br>}</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | name of the cluster | `string` | n/a | yes |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | values for container\_definitions | <pre>map(<br>    object({<br>      name      = string<br>      image     = string<br>      cpu       = optional(number, 256) # 0.5 vCPU<br>      memory    = optional(number, 512) # 512 MiB<br>      essential = optional(bool, true)<br>      expose    = optional(bool, false)<br><br>      port_mappings = optional(list(object({<br>        name          = string<br>        containerPort = number<br>        hostPort      = optional(number, null)<br>        protocol      = string<br>        appProtocol   = string<br>      })), [])<br><br>      mountPoints = optional(list(object({<br>        sourceVolume  = optional(string)<br>        containerPath = optional(string)<br>        readOnly      = optional(bool, false)<br>      })), [])<br><br>      environment_variables = optional(list(object({<br>        name  = string<br>        value = string<br>      })), [])<br><br>      secrets = optional(list(object({<br>        name      = string<br>        valueFrom = string<br>      })), [])<br><br>      logConfiguration = optional(object({<br>        logDriver = string<br>        options   = optional(map(string))<br>      }))<br><br>      firelensConfiguration = optional(object({<br>        type    = optional(string)<br>        options = optional(map(string))<br>      }))<br><br>      health_check = optional(object({<br>        command     = optional(list(string))<br>        retries     = optional(number, 5)<br>        timeout     = optional(number, 10)<br>        interval    = optional(number, 5)<br>        startPeriod = optional(number, 30)<br>        }<br>      ))<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_create_autoscaling"></a> [create\_autoscaling](#input\_create\_autoscaling) | value for create\_autoscaling | `bool` | `false` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | value for desired\_count | `number` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | value for execution\_role\_arn | `string` | `""` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | values for load\_balancer | <pre>object({<br>    target_group_arn = string<br>    container_name   = string<br>    container_port   = number<br>  })</pre> | `null` | no |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | Time retention in dyas to log groups | `number` | `7` | no |
| <a name="input_name"></a> [name](#input\_name) | value for name | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | The network mode to use for the task | `string` | `"bridge"` | no |
| <a name="input_privileged"></a> [privileged](#input\_privileged) | value for privileged | `bool` | `false` | no |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | The scheduling strategy to use for the service | `string` | `"REPLICA"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | value for security\_groups | `list(string)` | n/a | yes |
| <a name="input_service_connect_configuration"></a> [service\_connect\_configuration](#input\_service\_connect\_configuration) | The ECS Service Connect configuration for this service to discover and connect to services, and be discovered by, and connected from, other services within a namespace | `any` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | value for subnets | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags to apply to the ECS cluster | `map(string)` | <pre>{<br>  "AmazonECSManaged": "true",<br>  "created": "",<br>  "documentation": "",<br>  "env": "",<br>  "repository": "",<br>  "service": "",<br>  "team": ""<br>}</pre> | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services | `string` | `null` | no |
| <a name="input_volume"></a> [volume](#input\_volume) | Volume configuration for the task | <pre>list(object({<br>    name      = string<br>    host_path = string<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
