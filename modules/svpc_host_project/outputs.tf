output "host_project_name" {
  value = module.host-project.name
}

output "host_project_number" {
  value = module.host-project.number
}

output "host_project_id" {
  value = module.host-project.project_id
}

output "network_name" {
  value       = module.vpc.network_name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = module.vpc.network_id
  description = "The ID of the VPC being created"
}

output "network_self_link" {
  value       = module.vpc.network_self_link
  description = "The URI of the VPC being created"
}
