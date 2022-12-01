<!-- BEGIN_TF_DOCS -->
# loadbalancer subnets

This submodule is part of the the network module. It creates the individual vpc loadbalancer subnets.

## Example Usage
```hcl
module "loadbalancer_subnets" {
    source                 = "../../modules/network/loadbalancer_subnets"
    project_id             = "<PROJECT ID>"
    create_lbsubnet        = true
    lbsubnets = [
        {
            subnet_name   = "lbsubnet-01"
            subnet_ip     = "192.168.0.0/24"
            subnet_region = "asia-northeast3"
        }
    ]
    lookup_project_numbers = true
    lookup_vpc_id          = true
    network_name           = "<VPC NAME>"
    lookup_host_project_id = "<HOST PROJECT ID>"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_lbsubnet"></a> [create\_lbsubnet](#input\_create\_lbsubnet) | (Optional) Flag to create a load balancer subnet | `bool` | `false` | no |
| <a name="input_lbsubnets"></a> [lbsubnets](#input\_lbsubnets) | (Optional) The list of loadbalancer subnets being created | `list(map(string))` | n/a | yes |
| <a name="input_lookup_host_project_id"></a> [lookup\_host\_project\_id](#input\_lookup\_host\_project\_id) | (Optional) Project id to look up in the data sources | `string` | `""` | no |
| <a name="input_lookup_project_numbers"></a> [lookup\_project\_numbers](#input\_lookup\_project\_numbers) | (Optional) Whether to look up the project numbers from data sources. | `bool` | `false` | no |
| <a name="input_lookup_vpc_id"></a> [lookup\_vpc\_id](#input\_lookup\_vpc\_id) | (Optional) Whether to look up the vpc id from data sources. | `bool` | `false` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | (Optional) The name of the resource, provided by the client when initially creating the resource | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Required) The ID of the service project | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_subnetwork"></a> [lb\_subnetwork](#output\_lb\_subnetwork) | The created loadbalancer subnet resources |
<!-- END_TF_DOCS -->