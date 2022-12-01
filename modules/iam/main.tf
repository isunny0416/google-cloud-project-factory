locals {
  organization = var.role_for == "organization"
  folder       = var.role_for == "folder"
  project      = var.role_for == "project"
}
