module "default_audit_log_sync" {
  source                   = "../../modules/logging"
  project_id               = var.project_id
  name                     = var.log_sync_name
  filter                   = <<EOT
    LOG_ID("cloudaudit.googleapis.com/activity") OR 
    LOG_ID("externalaudit.googleapis.com/activity") OR 
    LOG_ID("cloudaudit.googleapis.com/system_event") OR 
    LOG_ID("externalaudit.googleapis.com/system_event") OR 
    LOG_ID("cloudaudit.googleapis.com/access_transparency") OR 
    LOG_ID("externalaudit.googleapis.com/access_transparency")
  EOT
  lookup_logger_project_id = var.lookup_logger_project_id
  lookup_project_numbers   = true
  logger_bucket            = var.logger_bucket
  logger_region            = var.logger_region
}