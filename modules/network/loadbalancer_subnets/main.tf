module "helper" {
  source                 = "../../../modules/helper"
  project_id             = var.lookup_host_project_id
  lookup_project_numbers = var.lookup_project_numbers
  lookup_vpc_id          = var.lookup_vpc_id
  network_name           = var.network_name
}

locals {
  host_project_id = module.helper.google_project.project_id
  vpc_id          = module.helper.google_host_vpc.id
  lbsubnets       = { for x in var.lbsubnets : "${x.subnet_region}/${x.subnet_name}" => x }
}

resource "google_compute_subnetwork" "loadbalancer_subnetwork" {
  for_each      = length(var.lbsubnets) > 0 && var.create_lbsubnet ? local.lbsubnets : {}
  project       = local.host_project_id
  name          = each.value.subnet_name
  ip_cidr_range = each.value.subnet_ip
  region        = each.value.subnet_region
  network       = local.vpc_id
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
  role          = "ACTIVE"
}
