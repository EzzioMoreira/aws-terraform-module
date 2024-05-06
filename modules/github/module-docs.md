## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch.development](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch) | resource |
| [github_branch_default.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection_v3.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_repository.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Whether or not to allow squash merging | `bool` | `true` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | Whether or not to auto initialize the repository | `bool` | `true` | no |
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | The name of the branch | `string` | `null` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Whether or not to delete the branch on merge | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the repository | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the repository | `string` | `"internal"` | no |

## Outputs

No outputs.
