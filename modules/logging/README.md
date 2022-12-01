<!-- BEGIN_TF_DOCS -->
# Trail Log Sync Moudle

This module is for configuring cetnralized trail log environment.

## Example Usage
```hcl
module "default_audit_log_sync" {
  source                   = "../../modules/logging"
  project_id               = "<PROJECT ID>"
  name                     = "<LOG SYNC NAME>"
  filter                   = <<EOT
    LOG_ID("cloudaudit.googleapis.com/activity") OR 
    LOG_ID("externalaudit.googleapis.com/activity") OR 
    LOG_ID("cloudaudit.googleapis.com/system_event") OR 
    LOG_ID("externalaudit.googleapis.com/system_event") OR 
    LOG_ID("cloudaudit.googleapis.com/access_transparency") OR 
    LOG_ID("externalaudit.googleapis.com/access_transparency")
  EOT
  lookup_logger_project_id = "<LOGGER PROJECT ID>"
  lookup_project_numbers   = true
  logger_bucket            = "<LOGGER BUCKET NAME>"
  logger_region            = "<LOGGER REGION>"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_filter"></a> [filter](#input\_filter) | (Optional) The filter to apply when exporting logs. Only log entries that match the filter are exported. | `string` | `""` | no |
| <a name="input_logger_bucket"></a> [logger\_bucket](#input\_logger\_bucket) | (Required) The name of the containing bucket. | `string` | n/a | yes |
| <a name="input_logger_region"></a> [logger\_region](#input\_logger\_region) | (Required) The GCP region for this subnetwork | `string` | n/a | yes |
| <a name="input_lookup_logger_project_id"></a> [lookup\_logger\_project\_id](#input\_lookup\_logger\_project\_id) | (Optional) Project id to look up in the data sources | `string` | `""` | no |
| <a name="input_lookup_project_numbers"></a> [lookup\_project\_numbers](#input\_lookup\_project\_numbers) | (Optional) Whether to look up the project numbers from data sources. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the logging sink. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Required) The ID of the service project | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->