/*
 Allows creation and management of a Google Cloud Platform project.
 The user or service account that is running Terraform when 
 creating a google_project resource must have roles/resourcemanager.projectCreator on the specified organization. 
 See the Access Control for Organizations Using IAM doc for more information.
*/

locals {
  parent_type = split("/", var.parent)[0]
  parent_id   = split("/", var.parent)[1]
  apis        = concat(var.default_apis, var.activate_apis)
}

resource "random_string" "random" {
  length           = 4
  special          = false
  lower            = true
  upper            = false
}

resource "google_project" "project" {
  org_id              = local.parent_type == "organizations" ? local.parent_id : null
  folder_id           = local.parent_type == "folders" ? local.parent_id : null
  project_id          = "${var.prefix}-${var.name}-${random_string.random.result}"
  name                = "${var.prefix}-${var.name}-${var.suffix}"
  billing_account     = var.billing_account
  auto_create_network = var.auto_create_network
  labels              = var.labels
}

resource "google_project_service" "project_services" {
  for_each                   = toset(local.apis)
  project                    = google_project.project.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}

resource "google_resource_manager_lien" "lien" {
  count        = var.lien ? 1 : 0
  parent       = "projects/${google_project.project.number}"
  restrictions = ["resourcemanager.projects.delete"]
  origin       = "created-by-terraform"
  reason       = var.lien_reason
}
