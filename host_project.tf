module "host-project" {
  source          = "./modules/svpc_host_project"
  parent          = local.parent
  prefix          = local.prefix
  name            = "iac-ce-host"
  billing_account = local.billing_account
  activate_apis   = ["container.googleapis.com", "composer.googleapis.com"]
  shared_vpc_host = true
  create_lbsubnet = true
  lbsubnets = [
    {
      subnet_name   = "lbsubnet-01"
      subnet_ip     = "192.168.0.0/24"
      subnet_region = "asia-northeast3"
    }
  ]
  psc_name          = "iac-ce-lb-subnet"
  psc_address       = "192.168.1.0"
  psc_prefix_length = 24
  log_sync_name     = "audit_log_sync"
  logger_project_id = "prod-logger-project"
  logger_bucket     = "audit_log_bucket"
  logger_region     = "asia-northeast3"
  # routing_mode    = var.routing_mode
}
