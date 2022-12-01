variable "iam_root_id" {
  description = "(Required) The ID of the service project"
  type        = string
}

variable "iam_roles" {
  description = "(Optional) The role that should be applied"
  type        = list(string)
  default     = []
}

variable "role_for" {
  description = "(Required) The role that should be applied"
  type        = string
}

variable "member" {
  description = "(Required) Identities that will be granted the privilege in role"
  type        = string
}