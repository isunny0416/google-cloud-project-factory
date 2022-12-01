output "host_project" {
  value = {
    name   = module.host-project.host_project_name,
    id     = module.host-project.host_project_id,
    number = module.host-project.host_project_number
  }
}

output "svpc" {
  value = {
    name = module.host-project.network_name,
    id   = module.host-project.network_id
  }
}
