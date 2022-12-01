variable "parent" {
  description = "The resource name of the parent Folder or Organization. Must be of the form folders/folder_id or organizations/org_id."
  type        = string
  default     = "folders/1092549244244"
}

variable "billing_account" {
  description = "Billing account id."
  type        = string
  default     = "011502-A4E44C-DA5605"
}

variable "prefix" {
  description = "Prefix used to generate project id and name."
  type        = string
  default     = "dev"
}
