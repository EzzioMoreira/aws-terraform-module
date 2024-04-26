## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.47.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | github.com/EzzioMoreira/aws-terraform-module//modules/ecs-cluster | v0.0.1-ecs-cluster-alb |
| <a name="module_loadbalance"></a> [loadbalance](#module\_loadbalance) | github.com/EzzioMoreira/aws-terraform-module//modules/loadbalance | v0.0.1-ecs-cluster-alb |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_o11y"></a> [cluster\_o11y](#output\_cluster\_o11y) | value of the ecs cluster |
| <a name="output_loadbalance"></a> [loadbalance](#output\_loadbalance) | value of the loadbalance |
