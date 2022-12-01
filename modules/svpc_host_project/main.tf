
module "host-project" {
  source          = "../../modules/project"
  parent          = var.parent
  prefix          = var.prefix
  name            = var.name
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
}

module "baselines" {
  source                   = "../../modules/baselines"
  policy_root_id           = module.host-project.number
  iam_root_id              = module.host-project.number
  project_id               = module.host-project.project_id
  log_sync_name            = var.log_sync_name
  lookup_logger_project_id = var.logger_project_id
  logger_bucket            = var.logger_bucket
  logger_region            = var.logger_region
  depends_on = [
    module.host-project
  ]
}

module "vpc" {
  source          = "../../modules/network/vpc"
  project_id      = module.host-project.project_id
  prefix          = var.prefix
  network_name    = var.name
  shared_vpc_host = var.shared_vpc_host
  create_lbsubnet = var.create_lbsubnet
  lbsubnets       = var.lbsubnets
  # routing_mode    = var.routing_mode
}

module "loadbalancer_subnets" {
  source                 = "../../modules/network/loadbalancer_subnets"
  project_id             = module.host-project.project_id
  create_lbsubnet        = true
  lbsubnets              = var.lbsubnets
  lookup_project_numbers = true
  lookup_vpc_id          = true
  network_name           = module.vpc.network_name
  lookup_host_project_id = module.host-project.project_id
}

module "private_service_connect" {
  source                 = "../../modules/network/private_service_connect"
  project_id             = module.host-project.project_id
  lookup_project_numbers = true
  lookup_vpc_id          = true
  network_name           = module.vpc.network_name
  lookup_host_project_id = module.host-project.project_id
  name                   = var.psc_name
  address                = var.psc_address
  prefix_length          = var.psc_prefix_length
}