variable "project_id" {
  description = "(Required) The ID of the service project"
  type        = string
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

variable "create_lbsubnet" {
  description = "(Optional) Flag to create a load balancer subnet"
  type        = bool
  default     = false
}

variable "lbsubnets" {
  description = "(Optional) The list of loadbalancer subnets being created"
  type        = list(map(string))
}