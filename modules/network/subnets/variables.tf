variable "project_id" {
  description = "(Required) The ID of the service project"
  type        = string
}

variable "lookup_project_numbers" {
  description = "(Optional) Whether to look up the project numbers from data sources."
  type        = bool
  default     = false
}

variable "lookup_host_project_id" {
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
  description = "(Optional) The name of the resource, provided by the client when initially creating the resource"
  type        = string
  default     = ""
}

variable "subnets" {
  description = "(Required) The list of subnets being created"
  type        = list(map(string))

}

variable "secondary_ranges" {
  description = "(Optional) Secondary ranges that will be used in some of the subnets"
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  default     = {}
}
