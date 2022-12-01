variable "policy_root" {
  description = "(Optional) Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
  default     = "project"
}

variable "policy_root_id" {
  description = "(Optional) The policy root id, either of organization_id, folder_id or project_id"
  type        = string
  default     = null
}

variable "exclude_folders" {
  description = "(Optional) Set of folders to exclude from the policy"
  type        = set(string)
  default     = []
}

variable "exclude_projects" {
  description = "(Optional) Set of projects to exclude from the policy"
  type        = set(string)
  default     = []
}

variable "constraint" {
  description = "(Required) The constraint to be applied"
  type        = string
}

variable "policy_type" {
  description = "(Optional) The constraint type to work with (either 'boolean' or 'list')"
  type        = string
  default     = "list"
}

variable "rules" {
  description = "(Optional) List of rules per policy. Upto 10."
  type = list(object({
    enforcement = bool,
    allow       = list(string)
    deny        = list(string)
    conditions  = list(any)
  }))
}

