<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_host-project"></a> [host-project](#module\_host-project) | ./modules/svpc_host_project | n/a |
| <a name="module_service-project"></a> [service-project](#module\_service-project) | ./modules/svpc_service_project | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing account id. | `string` | `"011502-A4E44C-DA5605"` | no |
| <a name="input_parent"></a> [parent](#input\_parent) | The resource name of the parent Folder or Organization. Must be of the form folders/folder\_id or organizations/org\_id. | `string` | `"folders/1092549244244"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix used to generate project id and name. | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_host_project"></a> [host\_project](#output\_host\_project) | n/a |
| <a name="output_svpc"></a> [svpc](#output\_svpc) | n/a |
<!-- END_TF_DOCS -->