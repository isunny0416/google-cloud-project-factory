module "helper" {
  source                 = "../../modules/helper"
  project_id             = var.lookup_logger_project_id
  lookup_project_numbers = var.lookup_project_numbers
}

locals {
  logger_project_id = module.helper.google_project.project_id
  destination       = "logging.googleapis.com/projects/${local.logger_project_id}/locations/${var.logger_region}/buckets/${var.logger_bucket}"
}

resource "google_logging_project_sink" "cloudtrail-log-sink" {
  project                = var.project_id
  name                   = var.name
  destination            = local.destination
  filter                 = var.filter
  unique_writer_identity = true
}

resource "google_project_iam_member" "project_iam_sync_member" {
  project = local.logger_project_id
  role    = "roles/logging.bucketWriter"
  member  = google_logging_project_sink.cloudtrail-log-sink.writer_identity
}
