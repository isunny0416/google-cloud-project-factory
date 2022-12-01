module "helper" {
  source                 = "../../../modules/helper"
  lookup_project_numbers = var.lookup_project_numbers
  project_id             = var.lookup_host_project_id
  lookup_vpc_id          = var.lookup_vpc_id
  network_name           = var.network_name
}

locals {
  subnets           = { for x in var.subnets : "${x.subnet_region}/${x.subnet_name}" => x }
  vpc_id            = module.helper.google_host_vpc.id
  host_project_name = module.helper.google_project.name
  host_project_id   = module.helper.google_project.project_id
}

resource "google_compute_subnetwork" "subnetwork" {
  for_each                 = local.subnets
  project                  = local.host_project_id
  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_ip
  region                   = each.value.subnet_region
  private_ip_google_access = true
  network                  = local.vpc_id
  description              = lookup(each.value, "description", null)
  secondary_ip_range = [
    for i in range(
      length(
        contains(keys(var.secondary_ranges), each.value.subnet_name) == true ? var.secondary_ranges[each.value.subnet_name] : []
    )) :
    var.secondary_ranges[each.value.subnet_name][i]
  ]
}
