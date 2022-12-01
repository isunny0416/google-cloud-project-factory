variable "parent" {
  description = "(Required) The resource name of the parent Folder or Organization. Must be of the form folders/folder_id or organizations/org_id."
  type        = string
}

variable "prefix" {
  description = "(Required) Prefix used to generate project id and name."
  type        = string
}

variable "suffix" {
  description = "(Optional) Suffix used to generate project id and name."
  type        = string
  default     = "project"
}

variable "name" {
  description = "(Required) Project name and id suffix."
  type        = string
}

variable "billing_account" {
  description = "(Required) Billing account id."
  type        = string
}

variable "default_apis" {
  description = "(Optional) Default Service APIs to enable."
  type        = list(string)
  default     = ["compute.googleapis.com", "servicenetworking.googleapis.com", "vpcaccess.googleapis.com", "orgpolicy.googleapis.com", "dns.googleapis.com"]
}

variable "activate_apis" {
  description = "(Optional) Service APIs to enable."
  type        = list(string)
  default     = []
}

variable "lien" {
  description = "(Optional) Protecting projects from accidental deletion with liens"
  type        = bool
  default     = true
}

variable "lien_reason" {
  description = "(Optional) If non-empty, creates a project lien with this description."
  type        = string
  default     = ""
}

variable "auto_create_network" {
  description = "(Optional) Whether to create the default network for the project"
  type        = bool
  default     = false
}

variable "labels" {
  description = "(Optional) Resource labels."
  type        = map(string)
  default     = {}
}

