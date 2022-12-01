data "google_project" "google_project" {
  count      = var.lookup_project_numbers ? 1 : 0
  project_id = var.project_id
}

data "google_compute_network" "google_host_vpc" {
  count   = var.lookup_vpc_id ? 1 : 0
  project = var.project_id
  name    = var.network_name
}