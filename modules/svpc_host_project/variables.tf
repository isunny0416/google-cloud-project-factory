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
  default     = ["container.googleapis.com", "composer.googleapis.com", "orgpolicy.googleapis.com"]
}

variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "The network routing mode (default 'REGIONAL')"
}

variable "shared_vpc_host" {
  type        = bool
  description = "Makes this project a Shared VPC host if 'true' (default 'true')"
  default     = true
}

variable "create_lbsubnet" {
  description = "(Optional) Flag to create a load balancer subnet"
  type        = bool
  default     = false
}

variable "lbsubnets" {
  description = "(Optional) The list of loadbalancer subnets being created"
  type        = list(map(string))
}

variable "psc_name" {
  description = "(Required) Name of the private service connect resource"
  type        = string
}

variable "psc_address" {
  description = "(Optional) The IP address or beginning of the address range represented by this resource. This can be supplied as an input to reserve a specific address or omitted to allow GCP to choose a valid one for you."
  type        = string
}

variable "psc_prefix_length" {
  description = "(Optional) The prefix length of the IP range. If not present, it means the address field is a single IP address"
  type        = number
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