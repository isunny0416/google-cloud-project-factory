variable "project_id" {
  description = "(Optional) Project id to look up in the data sources"
  type        = string
}

variable "lookup_project_numbers" {
  description = "(Optional) Whether to look up the project numbers from data sources."
  type        = bool
  default     = false
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

variable "lookup_host_project_id" {
  description = "(Optional) Project id to look up in the data sources"
  type        = string
  default     = ""
}

variable "name" {
  description = "(Required) Name of the resource"
  type        = string
}

variable "address" {
  description = "(Optional) The IP address or beginning of the address range represented by this resource. This can be supplied as an input to reserve a specific address or omitted to allow GCP to choose a valid one for you."
  type        = string
}

variable "prefix_length" {
  description = "(Optional) The prefix length of the IP range. If not present, it means the address field is a single IP address"
  type        = number
}