variable "lookup_project_numbers" {
  description = "(Optional) Whether to look up the project numbers from data sources."
  type        = bool
  default     = false
}

variable "project_id" {
  description = "(Optional) Project id to look up in the data sources"
  type        = string
  default     = ""
}

variable "lookup_vpc_id" {
  description = "(Optional) Whether to look up the vpc id from data sources."
  type        = bool
  default     = false
}

variable "network_name" {
  description = "(Optional) VPC name to look up in the data source"
  type        = string
  default     = ""
}
