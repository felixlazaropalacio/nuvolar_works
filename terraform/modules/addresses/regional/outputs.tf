output "regional_ip_names" {
  value       = [for regional_ip in google_compute_address.ip : regional_ip.name]
  description = "Regional IP name"
}

output "regional_ip_address" {
  value       = [for regional_ip in google_compute_address.ip : regional_ip.address]
  description = "Regional IP name"
}
