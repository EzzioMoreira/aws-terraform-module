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
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.up_cpu_scaling_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_ecs_capacity_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_service_discovery_http_namespace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_http_namespace) | resource |
| [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscaling_instace_type"></a> [autoscaling\_instace\_type](#input\_autoscaling\_instace\_type) | value of the instance type of the ECS cluster | <pre>list(object({<br>    instance_type     = string<br>    weighted_capacity = number<br>  }))</pre> | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | value of the ECS cluster name | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | value of the desired capacity of the ECS cluster | `number` | n/a | yes |
| <a name="input_down_cpu_scaling_policy"></a> [down\_cpu\_scaling\_policy](#input\_down\_cpu\_scaling\_policy) | value of the down cpu scaling policy of the ECS cluster | <pre>object({<br>    scaling_adjustment = number<br>    cooldown           = number<br>    cpu_target_value   = number<br>  })</pre> | <pre>{<br>  "cooldown": 300,<br>  "cpu_target_value": 40,<br>  "scaling_adjustment": -1<br>}</pre> | no |
| <a name="input_instance_market"></a> [instance\_market](#input\_instance\_market) | value of the instance market of the ECS cluster | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | value of the instance type of the ECS cluster | `string` | `"t3.medium"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | value of the maximum size of the ECS cluster | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | value of the minimum size of the ECS cluster | `number` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | value of the subnet IDs of the ECS cluster | `list(string)` | <pre>[<br>  "subnet-006bc41eeaeef42b1",<br>  "subnet-0e250f6caeebdf88b",<br>  "subnet-039de1a90eaf9955a"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags to apply to the ECS cluster | `map(string)` | <pre>{<br>  "AmazonECSManaged": "true",<br>  "created": "",<br>  "documentation": "",<br>  "env": "",<br>  "repository": "",<br>  "service": "",<br>  "team": ""<br>}</pre> | no |
| <a name="input_up_cpu_scaling_policy"></a> [up\_cpu\_scaling\_policy](#input\_up\_cpu\_scaling\_policy) | value of the up cpu scaling policy of the ECS cluster | <pre>object({<br>    scaling_adjustment = number<br>    cooldown           = number<br>    cpu_target_value   = number<br>  })</pre> | <pre>{<br>  "cooldown": 300,<br>  "cpu_target_value": 80,<br>  "scaling_adjustment": 1<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | value of the VPC ID of the ECS cluster | `string` | `"vpc-0fdcf082b368d1f78"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_name"></a> [autoscaling\_name](#output\_autoscaling\_name) | n/a |
| <a name="output_ecs_cluster"></a> [ecs\_cluster](#output\_ecs\_cluster) | value of the ecs cluster |
| <a name="output_namespace_arn"></a> [namespace\_arn](#output\_namespace\_arn) | value of the namespace arn |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | value of the vpc id |
