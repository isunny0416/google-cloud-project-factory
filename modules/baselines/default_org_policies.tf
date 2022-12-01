#
# project level baselines
#
module "skip_default_network" {
  source         = "../../modules/org_policy"
  policy_root    = "project"
  policy_root_id = var.policy_root_id
  rules = [{
    enforcement = true,
    allow       = [],
    deny        = [],
    conditions  = []
  }]
  constraint  = "constraints/compute.skipDefaultNetworkCreation"
  policy_type = "boolean"
}

module "restrict_svpc_lien" {
  source         = "../../modules/org_policy"
  policy_root    = "project"
  policy_root_id = var.policy_root_id
  rules = [{
    enforcement = true,
    allow       = [],
    deny        = [],
    conditions  = []
  }]
  constraint  = "constraints/compute.restrictXpnProjectLienRemoval"
  policy_type = "boolean"
}

module "restrict_sql_external_ips" {
  source         = "../../modules/org_policy"
  policy_root    = "project"
  policy_root_id = var.policy_root_id
  rules = [{
    enforcement = true,
    allow       = [],
    deny        = [],
    conditions  = []
  }]
  constraint  = "constraints/sql.restrictPublicIp"
  policy_type = "boolean"
}

module "restrict_vm_external_ips" {
  source         = "../../modules/org_policy"
  policy_root    = "project"
  policy_root_id = var.policy_root_id
  rules = [{
    enforcement = true,
    allow       = [],
    deny        = [],
    conditions  = []
  }]
  constraint  = "constraints/compute.vmExternalIpAccess"
  policy_type = "list"
}

module "storage_public_access_prevention" {
  source         = "../../modules/org_policy"
  policy_root    = "project"
  policy_root_id = var.policy_root_id
  rules = [{
    enforcement = true,
    allow       = [],
    deny        = [],
    conditions  = []
  }]
  constraint  = "constraints/storage.publicAccessPrevention"
  policy_type = "boolean"
}
