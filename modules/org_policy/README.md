<!-- BEGIN_TF_DOCS -->
# Google Cloud Organization Policy v2 Terraform Module

This Terraform module makes it easier to manage [organization policies](https://cloud.google.com/resource-manager/docs/organization-policy/overview) for your Google Cloud environment, particularly when you want to have exclusion rules. This module will allow you to set a top-level org policy and then disable it on individual projects or folders easily. This module allows **_conditional policy enforcements based on the latest API version_** of the organization policies API.

Organization Policies are of two types `boolean` and `list`.

---

## Usage
Example usage is included in the [examples](./examples/org_policy_v2) folder, but simple usage is as follows:

```hcl
module "skip_default_network" {
  source         = "../../modules/org_policy"
  policy_root    = "project"
  policy_root_id = "<PROJECT ID>"
  rules = [{
    enforcement = true,
    allow       = [],
    deny        = [],
    conditions  = []
  }]
  constraint  = "constraint name"
  policy_type = "boolean"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_constraint"></a> [constraint](#input\_constraint) | (Required) The constraint to be applied | `string` | n/a | yes |
| <a name="input_exclude_folders"></a> [exclude\_folders](#input\_exclude\_folders) | (Optional) Set of folders to exclude from the policy | `set(string)` | `[]` | no |
| <a name="input_exclude_projects"></a> [exclude\_projects](#input\_exclude\_projects) | (Optional) Set of projects to exclude from the policy | `set(string)` | `[]` | no |
| <a name="input_policy_root"></a> [policy\_root](#input\_policy\_root) | (Optional) Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | `"project"` | no |
| <a name="input_policy_root_id"></a> [policy\_root\_id](#input\_policy\_root\_id) | (Optional) The policy root id, either of organization\_id, folder\_id or project\_id | `string` | `null` | no |
| <a name="input_policy_type"></a> [policy\_type](#input\_policy\_type) | (Optional) The constraint type to work with (either 'boolean' or 'list') | `string` | `"list"` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | (Optional) List of rules per policy. Upto 10. | <pre>list(object({<br>    enforcement = bool,<br>    allow       = list(string)<br>    deny        = list(string)<br>    conditions  = list(any)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_constraint"></a> [constraint](#output\_constraint) | Policy Constraint Identifier without constraints/ prefix |
| <a name="output_policy_root"></a> [policy\_root](#output\_policy\_root) | Policy Root in the hierarchy for the given policy |
| <a name="output_policy_root_id"></a> [policy\_root\_id](#output\_policy\_root\_id) | Project Root ID at which the policy is applied |
<!-- END_TF_DOCS -->