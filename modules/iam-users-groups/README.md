<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.admin_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.admin_group_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_user.admin_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.admin_group_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_login_profile.logins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [local_file.pgp_key_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_group_name"></a> [admin\_group\_name](#input\_admin\_group\_name) | Admin group name | `string` | n/a | yes |
| <a name="input_admin_group_policy_attachment_arn"></a> [admin\_group\_policy\_attachment\_arn](#input\_admin\_group\_policy\_attachment\_arn) | Which policy to use for the admin group | `string` | `"arn:aws:iam::aws:policy/AdministratorAccess"` | no |
| <a name="input_admin_users"></a> [admin\_users](#input\_admin\_users) | A set of user names to create in AWS | `set(string)` | n/a | yes |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | Path to PGP public key file | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_passwords"></a> [user\_passwords](#output\_user\_passwords) | n/a |
<!-- END_TF_DOCS -->