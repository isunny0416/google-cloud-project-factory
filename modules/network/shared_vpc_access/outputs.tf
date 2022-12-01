output "activate_sa" {
  description = "Enabled service api emails"
  value       = local.activate_sa
  depends_on  = [google_project_service_identity.project_service_emails]
}

output "apis" {
  value = local.apis
}