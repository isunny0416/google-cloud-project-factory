variable "parent" {
  description = "The resource name of the parent Folder or Organization. Must be of the form folders/folder_id or organizations/org_id."
  type        = string
}

variable "prefix" {
  description = "Prefix used to generate project id and name."
  type        = string
}

variable "name" {
  description = "Project name and id suffix."
  type        = string
}

variable "billing_account" {
  description = "Billing account id."
  type        = string
  default     = ""
}

variable "activate_apis" {
  description = "Service APIs to enable."
  type        = list(string)
  default     = ["container.googleapis.com", "composer.googleapis.com"]
}

variable "lookup_project_numbers" {
  description = "Whether to look up the project numbers from data sources."
  type        = bool
  default     = false
}

variable "lookup_host_project_id" {
  type    = string
  default = ""
}

variable "lookup_vpc_id" {
  description = "Whether to look up the vpc id from data sources."
  type        = bool
  default     = false
}

variable "network_name" {
  description = "The name of the network where subnets will be created"
  type        = string
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "log_sync_name" {
  description = "(Required) The name of the logging sink."
  type        = string
}

variable "logger_project_id" {
  description = "(Optional) Project id to look up in the data sources"
  type        = string
  default     = ""
}

variable "logger_bucket" {
  description = "(Required) The name of the containing bucket."
  type        = string
}

variable "logger_region" {
  description = "(Required) The GCP region for this subnetwork"
  type        = string
}