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
| [aws_ecs_capacity_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | value of the ECS cluster name | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | value of the desired capacity of the ECS cluster | `number` | n/a | yes |
| <a name="input_instance_market"></a> [instance\_market](#input\_instance\_market) | value of the instance market of the ECS cluster | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | value of the instance type of the ECS cluster | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | value of the maximum size of the ECS cluster | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | value of the minimum size of the ECS cluster | `number` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | value of the subnet IDs of the ECS cluster | `list(string)` | <pre>[<br>  "subnet-006bc41eeaeef42b1",<br>  "subnet-0e250f6caeebdf88b",<br>  "subnet-039de1a90eaf9955a"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags to apply to the ECS cluster | `map(string)` | <pre>{<br>  "AmazonECSManaged": "true",<br>  "created": "",<br>  "documentation": "",<br>  "env": "",<br>  "repository": "",<br>  "service": "",<br>  "team": ""<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | value of the VPC ID of the ECS cluster | `string` | `"vpc-0fdcf082b368d1f78"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_name"></a> [autoscaling\_name](#output\_autoscaling\_name) | n/a |
| <a name="output_ecs_cluster"></a> [ecs\_cluster](#output\_ecs\_cluster) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
