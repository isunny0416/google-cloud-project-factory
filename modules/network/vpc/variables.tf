variable "project_id" {
  description = "(Required) The ID of the project where this VPC will be created"
  type        = string
}

variable "prefix" {
  description = "(Required) Prefix used to generate vpc name."
  type        = string
}

variable "network_name" {
  description = "(Required) The name of the network being created"
  type        = string
}

variable "suffix" {
  description = "Suffix used to generate vpc name."
  type        = string
  default     = "vpc"
}

variable "routing_mode" {
  description = "(Optional) The network routing mode (default 'REGIONAL')"
  type        = string
  default     = "REGIONAL"

}

variable "shared_vpc_host" {
  description = "(Optional) Makes this project a Shared VPC host if 'true' (default 'true')"
  type        = bool
  default     = true
}

variable "description" {
  description = "(Optional) An optional description of this resource. The resource must be recreated to modify this field."
  type        = string
  default     = ""
}

variable "auto_create_subnetworks" {
  description = "(Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  type        = bool
  default     = false
}

variable "delete_default_internet_gateway_routes" {
  description = "(Optional) If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  type        = bool
  default     = false
}

variable "mtu" {
  description = "(Optional) The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively."
  type        = number
  default     = 1460
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