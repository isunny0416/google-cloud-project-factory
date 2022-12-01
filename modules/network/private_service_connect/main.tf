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
  vpc_name        = module.helper.google_host_vpc.name
}

resource "google_compute_global_address" "private_ip_alloc" {
  provider      = google-beta
  project       = local.host_project_id
  name          = var.name
  ip_version    = "IPV4"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = local.vpc_id
  address       = var.address
  prefix_length = var.prefix_length
}

resource "google_service_networking_connection" "psc_networking_connection" {
  network                 = local.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
}

resource "google_compute_network_peering_routes_config" "psc_peering_routes" {
  project              = local.host_project_id
  peering              = google_service_networking_connection.psc_networking_connection.peering
  network              = local.vpc_name
  import_custom_routes = true
  export_custom_routes = true
}