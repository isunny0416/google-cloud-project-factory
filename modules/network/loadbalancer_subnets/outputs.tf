output "lb_subnetwork" {
  value       = google_compute_subnetwork.loadbalancer_subnetwork
  description = "The created loadbalancer subnet resources"
}