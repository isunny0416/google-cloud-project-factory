module "service-project" {
  source                 = "./modules/svpc_service_project"
  parent                 = local.parent
  prefix                 = local.prefix
  name                   = "iac-ce"
  billing_account        = local.billing_account
  activate_apis          = ["container.googleapis.com", "composer.googleapis.com"]
  lookup_host_project_id = module.host-project.host_project_id
  network_name           = module.host-project.network_name
  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "asia-northeast3"
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "asia-northeast3"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      description           = "This subnet has a description"
    }
  ]
  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = "subnet-01-secondary-01"
        ip_cidr_range = "192.168.64.0/24"
      },
    ]
  }
  log_sync_name     = "audit_log_sync"
  logger_project_id = "prod-logger-project"
  logger_bucket     = "audit_log_bucket"
  logger_region     = "asia-northeast3"
  depends_on        = [module.host-project]
}