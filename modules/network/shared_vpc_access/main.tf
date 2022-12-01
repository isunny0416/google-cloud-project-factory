module "helper" {
  source                 = "../../../modules/helper"
  lookup_project_numbers = var.lookup_project_numbers
  project_id             = var.lookup_host_project_id
}

locals {
  host_project_id = module.helper.google_project.project_id
  default_sa      = [format("%s@cloudservices.gserviceaccount.com", var.service_project_number)]
  apis            = tolist(setsubtract(var.activate_apis, ["compute.googleapis.com", "dns.googleapis.com", "orgpolicy.googleapis.com"]))
  activate_sa = distinct(concat(local.default_sa,
  [for k, v in google_project_service_identity.project_service_emails : v.email]))
  members = [for i in local.activate_sa : "serviceAccount:${i}"]
}

resource "google_project_service_identity" "project_service_emails" {
  provider = google-beta
  count    = var.grant_network_role ? length(local.apis) : 0
  project  = var.service_project_id
  service  = element(local.apis, count.index)
}

resource "google_compute_subnetwork_iam_binding" "service_shared_vpc_subnet_sa" {
  provider   = google-beta
  for_each   = var.grant_network_role ? var.subnetwork : {}
  project    = local.host_project_id
  subnetwork = each.value.name
  role       = "roles/compute.networkUser"
  members    = local.members
  depends_on = [
    google_project_service_identity.project_service_emails
  ]
}

resource "google_project_organization_policy" "restrict_shared_subnetworks_policy" {
  project    = var.service_project_id
  count      = var.grant_network_role ? 1 : 0
  constraint = "compute.restrictSharedVpcSubnetworks"
  list_policy {
    allow {
      values = [for i in var.subnetwork : i.id]
    }
  }
}
