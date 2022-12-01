<!-- BEGIN_TF_DOCS -->
# Shared VPC

This submodule is part of the the network module. 
It creates a vpc network and optionally enables it as a Shared VPC host project.


## Example Usage
```hcl
module "vpc" {
    source  = ""../../modules/network/vpc"
    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"
    shared_vpc_host = true
    create_lbsubnet = true
    lbsubnets = [
        {
            subnet_name           = "lbsubnet-01"
            subnet_ip             = "192.168.0.0/24"
            subnet_region         = "asia-northeast3"
        }
    ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | (Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | `bool` | `false` | no |
| <a name="input_delete_default_internet_gateway_routes"></a> [delete\_default\_internet\_gateway\_routes](#input\_delete\_default\_internet\_gateway\_routes) | (Optional) If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) An optional description of this resource. The resource must be recreated to modify this field. | `string` | `""` | no |
| <a name="input_create_lbsubnet"></a> [enable\_lbsubnet](#input\_enable\_lbsubnet) | (Optional) Flag to create a load balancer subnet | `bool` | `false` | no |
| <a name="input_lbsubnets"></a> [lbsubnets](#input\_lbsubnets) | (Optional) The list of loadbalancer subnets being created | `list(map(string))` | n/a | yes |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | (Optional) The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively. | `number` | `1460` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | (Required) The name of the network being created | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) Prefix used to generate vpc name. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Required) The ID of the project where this VPC will be created | `string` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | (Optional) The network routing mode (default 'REGIONAL') | `string` | `"REGIONAL"` | no |
| <a name="input_shared_vpc_host"></a> [shared\_vpc\_host](#input\_shared\_vpc\_host) | (Optional) Makes this project a Shared VPC host if 'true' (default 'true') | `bool` | `true` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Suffix used to generate vpc name. | `string` | `"vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network"></a> [network](#output\_network) | The VPC resource being created |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The ID of the VPC being created |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | The name of the VPC being created |
| <a name="output_network_self_link"></a> [network\_self\_link](#output\_network\_self\_link) | The URI of the VPC being created |
<!-- END_TF_DOCS -->