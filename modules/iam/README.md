<!-- BEGIN_TF_DOCS -->
# iam

Updates the IAM policy to grant a role to a new member.

## Example Usage
```hcl
module "default_administrator" {
  source      = "../../modules/iam"
  role_for    = "project"
  iam_root_id = "<PROJECT ID>"
  iam_roles   = ["roles/editor"]
  member      = "group:email"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | (Optional) The role that should be applied | `list(string)` | `[]` | no |
| <a name="input_iam_root_id"></a> [iam\_root\_id](#input\_iam\_root\_id) | (Required) The ID of the service project | `string` | n/a | yes |
| <a name="input_member"></a> [member](#input\_member) | (Required) Identities that will be granted the privilege in role | `string` | n/a | yes |
| <a name="input_role_for"></a> [role\_for](#input\_role\_for) | (Required) The role that should be applied | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->