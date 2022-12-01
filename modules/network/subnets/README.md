<!-- BEGIN_TF_DOCS -->
# subnets

This submodule is part of the the network module. It creates the individual vpc subnets.

## Example Usage
```hcl
module "subnets" {
    source                 = "../../modules/network/subnets"
    lookup_project_numbers = true
    lookup_host_project_id = "<LOOKUP PROJECT ID>"
    lookup_vpc_id          = "<VPC ID>"
    network_name           = "example-vpc""
    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name                  = "subnet-03"
            subnet_ip                    = "10.10.30.0/24"
            subnet_region                = "us-west1"
            subnet_flow_logs             = "true"
            subnet_flow_logs_interval    = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling    = 0.7
            subnet_flow_logs_metadata    = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_filter_expr = "true"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
    project_id             = "<PROJECT ID>"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lookup_host_project_id"></a> [lookup\_host\_project\_id](#input\_lookup\_host\_project\_id) | (Optional) Project id to look up in the data sources | `string` | `""` | no |
| <a name="input_lookup_project_numbers"></a> [lookup\_project\_numbers](#input\_lookup\_project\_numbers) | (Optional) Whether to look up the project numbers from data sources. | `bool` | `false` | no |
| <a name="input_lookup_vpc_id"></a> [lookup\_vpc\_id](#input\_lookup\_vpc\_id) | (Optional) Whether to look up the vpc id from data sources. | `bool` | `false` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | (Optional) The name of the resource, provided by the client when initially creating the resource | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Required) The ID of the service project | `string` | n/a | yes |
| <a name="input_secondary_ranges"></a> [secondary\_ranges](#input\_secondary\_ranges) | (Optional) Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | (Required) The list of subnets being created | `list(map(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnetwork"></a> [subnetwork](#output\_subnetwork) | The created subnet resources |
| <a name="output_test"></a> [test](#output\_test) | n/a |
<!-- END_TF_DOCS -->