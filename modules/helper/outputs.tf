output "google_project" {
  description = "Project information retrieved from data source"
  value       = var.lookup_project_numbers ? data.google_project.google_project[0] : null
}

output "google_host_vpc" {
  description = "VPC information retrieved from data source"
  value       = var.lookup_vpc_id ? data.google_compute_network.google_host_vpc[0] : null
}