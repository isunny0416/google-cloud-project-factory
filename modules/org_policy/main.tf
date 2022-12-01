/******************************************
  Locals configuration for module logic
 *****************************************/
locals {
  organization   = var.policy_root == "organization"
  folder         = var.policy_root == "folder"
  project        = var.policy_root == "project"
  boolean_policy = var.policy_type == "boolean"
  list_policy    = var.policy_type == "list"
  rules = [
    for k, v in var.rules :
    merge(v, {
      allow_list_length = length(v.allow),
      deny_list_length  = length(v.deny),
      enforcement       = length(v.allow) > 0 || length(v.deny) > 0 ? null : v.enforcement,
      values            = [{ allow = v.allow, deny = v.deny }]
    })
  ]
}
