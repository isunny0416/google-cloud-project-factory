output "psc_id" {
  value = google_compute_global_address.private_ip_alloc.id
}

output "psc_self_link" {
  value = google_compute_global_address.private_ip_alloc.self_link
}