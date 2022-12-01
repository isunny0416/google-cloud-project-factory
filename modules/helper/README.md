<!-- BEGIN_TF_DOCS -->
# Utility modules

utility for setting common variables.

---

## Usage
Example usage is included in the [examples](./examples/org_policy_v2) folder, but simple usage is as follows:

```hcl
module "helper" {
  source                 = "../../../modules/helper"
  lookup_project_numbers = true
  project_id             = "<PROJECT ID>"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lookup_project_numbers"></a> [lookup\_project\_numbers](#input\_lookup\_project\_numbers) | (Optional) Whether to look up the project numbers from data sources. | `bool` | `false` | no |
| <a name="input_lookup_vpc_id"></a> [lookup\_vpc\_id](#input\_lookup\_vpc\_id) | (Optional) Whether to look up the vpc id from data sources. | `bool` | `false` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | (Optional) VPC name to look up in the data source | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Optional) Project id to look up in the data sources | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_google_host_vpc"></a> [google\_host\_vpc](#output\_google\_host\_vpc) | VPC information retrieved from data source |
| <a name="output_google_project"></a> [google\_project](#output\_google\_project) | Project information retrieved from data source |
<!-- END_TF_DOCS -->