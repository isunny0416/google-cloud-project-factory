locals {
  lookup_project_numbers = true
  lookup_host_project_id = var.lookup_host_project_id
  lookup_vpc_id          = true
  network_name           = var.network_name
}

module "service-project" {
  source          = "../../modules/project"
  parent          = var.parent
  prefix          = var.prefix
  name            = var.name
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
}

module "baselines" {
  source                   = "../../modules/baselines"
  policy_root_id           = module.service-project.project_id
  iam_root_id              = module.service-project.project_id
  project_id               = module.service-project.project_id
  log_sync_name            = var.log_sync_name
  lookup_logger_project_id = var.logger_project_id
  logger_bucket            = var.logger_bucket
  logger_region            = var.logger_region
  depends_on = [
    module.service-project
  ]
}

module "subnets" {
  source                 = "../../modules/network/subnets"
  lookup_project_numbers = local.lookup_project_numbers
  lookup_host_project_id = local.lookup_host_project_id
  lookup_vpc_id          = local.lookup_vpc_id
  network_name           = local.network_name
  subnets                = var.subnets
  secondary_ranges       = var.secondary_ranges
  project_id             = module.service-project.project_id
}

module "shared_vpc_access" {
  source                 = "../../modules/network/shared_vpc_access"
  lookup_project_numbers = local.lookup_project_numbers
  lookup_host_project_id = local.lookup_host_project_id
  service_project_number = module.service-project.number
  service_project_id     = module.service-project.project_id
  subnetwork             = module.subnets.subnetwork
  activate_apis          = var.activate_apis
  depends_on = [
    module.service-project,
    module.subnets
  ]
}