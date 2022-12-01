<!-- BEGIN_TF_DOCS -->
# Shared VPC Access

This submodule is part of the the network module. 
This module grants IAM permissions on host project and subnets to appropriate API service accounts based on activated APIs.

## Example Usage
```hcl
module "shared_vpc_access" {
  source                 = "../../modules/network/shared_vpc_access"
  lookup_project_numbers = true
  lookup_host_project_id = "<LOOKUP PROJECT ID>"
  service_project_number = "<PROJECT NUMBER>"
  service_project_id     = "<PROJECT ID>"
  subnetwork             = google_compute_subnetwork.subnetwork
  activate_apis          = [
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
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | (Optional) The list of active apis on the service project. If api is not active this module will not try to activate it | `list(string)` | `[]` | no |
| <a name="input_grant_network_role"></a> [grant\_network\_role](#input\_grant\_network\_role) | (Optional) Whether or not to grant service agents the network roles on the host project | `bool` | `true` | no |
| <a name="input_lookup_host_project_id"></a> [lookup\_host\_project\_id](#input\_lookup\_host\_project\_id) | (Required) The ID of the service project | `string` | n/a | yes |
| <a name="input_lookup_project_numbers"></a> [lookup\_project\_numbers](#input\_lookup\_project\_numbers) | (Optional) Whether to look up the project numbers from data sources. If false, `service_project_number` will be used instead. | `bool` | `true` | no |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | (Required) The ID of the service project | `string` | n/a | yes |
| <a name="input_service_project_number"></a> [service\_project\_number](#input\_service\_project\_number) | (Required) Project number of the service project. | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | (Required) The range of internal addresses that are owned by this subnetwork. | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activate_sa"></a> [activate\_sa](#output\_activate\_sa) | Enabled service api emails |
| <a name="output_apis"></a> [apis](#output\_apis) | n/a |
<!-- END_TF_DOCS -->