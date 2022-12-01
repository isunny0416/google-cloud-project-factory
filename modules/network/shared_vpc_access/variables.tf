variable "lookup_project_numbers" {
  description = "(Optional) Whether to look up the project numbers from data sources. If false, `service_project_number` will be used instead."
  type        = bool
  default     = true
}

variable "lookup_host_project_id" {
  description = "(Required) The ID of the service project"
  type        = string
}

variable "service_project_id" {
  description = "(Required) The ID of the service project"
  type        = string
}

variable "service_project_number" {
  description = "(Required) Project number of the service project."
  type        = string
}

variable "activate_apis" {
  description = "(Optional) The list of active apis on the service project. If api is not active this module will not try to activate it"
  type        = list(string)
  default     = []
}

variable "grant_network_role" {
  description = "(Optional) Whether or not to grant service agents the network roles on the host project"
  type        = bool
  default     = true
}

variable "subnetwork" {
  description = "(Required) The range of internal addresses that are owned by this subnetwork."
  type        = map(any)

}