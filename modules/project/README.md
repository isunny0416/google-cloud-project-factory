<!-- BEGIN_TF_DOCS -->
# Google Cloud Simple Project Creation

This module allows simple Google Cloud Platform project creation, with minimal service and project-level IAM binding management. It's designed to be used for architectural design and rapid prototyping, as part of the [Cloud Foundation Fabric](https://github.com/terraform-google-modules/cloud-foundation-fabric) environments.

## Usage

Basic usage of this module is as follows:

```hcl
module "host-project" {
    source          = "../../modules/project"
    parent          = "folders/1234567890"
    prefix          = "prod"
    name            = "rowan"
    billing_account = "ABCD-1234-ABCD-1234"
    activate_apis   = [
        "compute.googleapis.com",
        "container.googleapis.com",
        "dataproc.googleapis.com",
        "dataflow.googleapis.com",
    ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | (Optional) Service APIs to enable. | `list(string)` | `[]` | no |
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | (Optional) Whether to create the default network for the project | `bool` | `true` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | (Required) Billing account id. | `string` | n/a | yes |
| <a name="input_default_apis"></a> [default\_apis](#input\_default\_apis) | (Optional) Default Service APIs to enable. | `list(string)` | <pre>[<br>  "compute.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "vpcaccess.googleapis.com",<br>  "orgpolicy.googleapis.com",<br>  "dns.googleapis.com"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | (Optional) Resource labels. | `map(string)` | `{}` | no |
| <a name="input_lien"></a> [lien](#input\_lien) | (Optional) Protecting projects from accidental deletion with liens | `bool` | `true` | no |
| <a name="input_lien_reason"></a> [lien\_reason](#input\_lien\_reason) | (Optional) If non-empty, creates a project lien with this description. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Project name and id suffix. | `string` | n/a | yes |
| <a name="input_parent"></a> [parent](#input\_parent) | (Required) The resource name of the parent Folder or Organization. Must be of the form folders/folder\_id or organizations/org\_id. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) Prefix used to generate project id and name. | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | (Optional) Suffix used to generate project id and name. | `string` | `"project"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apis"></a> [apis](#output\_apis) | Enabled service api |
| <a name="output_name"></a> [name](#output\_name) | Name (depends on services). |
| <a name="output_number"></a> [number](#output\_number) | Project number (depends on services). |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Project id (depends on services). |
<!-- END_TF_DOCS -->