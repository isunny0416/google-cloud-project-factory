variable "policy_root_id" {
  description = "(Required) The policy root id, either of organization_id, folder_id or project_id"
  type        = string
}

variable "iam_root_id" {
  description = "(Required) The ID of the service project"
  type        = string
}

variable "project_id" {
  description = "(Required) The ID of the service project"
  type        = string
}

variable "lookup_project_numbers" {
  description = "(Optional) Whether to look up the project numbers from data sources."
  type        = bool
  default     = false
}

variable "lookup_logger_project_id" {
  description = "(Optional) Project id to look up in the data sources"
  type        = string
  default     = ""
}

variable "log_sync_name" {
  description = "(Required) The name of the logging sink."
  type        = string
}

variable "logger_bucket" {
  description = "(Required) The name of the containing bucket."
  type        = string
}

variable "logger_region" {
  description = "(Required) The GCP region for this subnetwork"
  type        = string
}