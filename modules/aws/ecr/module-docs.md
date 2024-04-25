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
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository | `string` | `"IMMUTABLE"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_repository_encryption_type"></a> [repository\_encryption\_type](#input\_repository\_encryption\_type) | The encryption type to use for the repository | `string` | `"AES256"` | no |
| <a name="input_repository_force_delete"></a> [repository\_force\_delete](#input\_repository\_force\_delete) | If the repository should be deleted even if it contains images | `bool` | `true` | no |
| <a name="input_repository_image_scan_on_push"></a> [repository\_image\_scan\_on\_push](#input\_repository\_image\_scan\_on\_push) | If the repository should have image scanning on push | `bool` | `true` | no |
| <a name="input_repository_kms_key"></a> [repository\_kms\_key](#input\_repository\_kms\_key) | The ARN of the KMS key to use when encrypting the repository | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource | `map(string)` | n/a | yes |

## Outputs

No outputs.
