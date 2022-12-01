<!-- BEGIN_TF_DOCS -->
# private service connect

This submodule is part of the the network module. It creates the individual private service connect.

## Example Usage
```hcl
module "private_service_connect" {
  source                 = "../../modules/network/private_service_connect"
  project_id             = "<PROJECT ID>"
  lookup_project_numbers = true
  lookup_vpc_id          = true
  network_name           = "<VPC NAME>"
  lookup_host_project_id = "<HOST PROJECT ID>"
  name                   = "<PRIVATE SERVICE CONNECT NAME>"
  address                = "<PRIVATE SERVICE CONNECT IP ADDRESS>"
  prefix_length          = "<PRIVATE SERVICE CONNECT IP NETMASK>"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address"></a> [address](#input\_address) | (Optional) The IP address or beginning of the address range represented by this resource. This can be supplied as an input to reserve a specific address or omitted to allow GCP to choose a valid one for you. | `string` | n/a | yes |
| <a name="input_lookup_host_project_id"></a> [lookup\_host\_project\_id](#input\_lookup\_host\_project\_id) | (Optional) Project id to look up in the data sources | `string` | `""` | no |
| <a name="input_lookup_project_numbers"></a> [lookup\_project\_numbers](#input\_lookup\_project\_numbers) | (Optional) Whether to look up the project numbers from data sources. | `bool` | `false` | no |
| <a name="input_lookup_vpc_id"></a> [lookup\_vpc\_id](#input\_lookup\_vpc\_id) | (Optional) Whether to look up the vpc id from data sources. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the resource | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | (Optional) VPC name to look up in the data source | `string` | `""` | no |
| <a name="input_prefix_length"></a> [prefix\_length](#input\_prefix\_length) | (Optional) The prefix length of the IP range. If not present, it means the address field is a single IP address | `number` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Optional) Project id to look up in the data sources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_psc_id"></a> [psc\_id](#output\_psc\_id) | n/a |
| <a name="output_psc_self_link"></a> [psc\_self\_link](#output\_psc\_self\_link) | n/a |
<!-- END_TF_DOCS -->