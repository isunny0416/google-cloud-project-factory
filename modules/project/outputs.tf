#

output "project_id" {
  description = "Project id (depends on services)."
  value       = trimprefix(google_project.project.id, "projects/")
  depends_on  = [google_project_service.project_services]
}

output "name" {
  description = "Name (depends on services)."
  value       = google_project.project.name
  depends_on  = [google_project_service.project_services]
}

output "number" {
  description = "Project number (depends on services)."
  value       = google_project.project.number
  depends_on  = [google_project_service.project_services]
}

output "apis" {
  description = "Enabled service api"
  value       = local.apis
  depends_on  = [google_project_service.project_services]
}

# output "apis" {
#   description = "Enabled service api"
#   value = { for k, v in google_project_service.project_services : k => v.email }
#   depends_on = [google_project_service.project_services]
# }
