## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region of Amazon AWS | `string` | `"us-east-1"` | no |
| <a name="input_backup_retention"></a> [backup\_retention](#input\_backup\_retention) | The backup retention period | `number` | `7` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username of the database | `string` | `"postgres"` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine | `string` | `"postgres"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version for database | `string` | `"16.1"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The RDS instance class | `string` | `"db.t3.micro"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Whether to create a Multi-AZ RDS instance | `bool` | `false` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate | `string` | `"default.postgres16"` | no |
| <a name="input_port"></a> [port](#input\_port) | The database port | `number` | `"5432"` | no |
| <a name="input_publicly_accessible_rds"></a> [publicly\_accessible\_rds](#input\_publicly\_accessible\_rds) | Whether the RDS instance is publicly accessible | `bool` | `false` | no |
| <a name="input_snapshot"></a> [snapshot](#input\_snapshot) | Whether to create a final snapshot | `string` | `"true"` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | The allocated storage | `number` | `20` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The type of the storage | `string` | `"gp3"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags to apply to the ECS cluster | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | value of the VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_hostname"></a> [rds\_hostname](#output\_rds\_hostname) | Hostname da instância RDS |
| <a name="output_ssm_rds"></a> [ssm\_rds](#output\_ssm\_rds) | values of the secrets stored in AWS Secrets Manager |
