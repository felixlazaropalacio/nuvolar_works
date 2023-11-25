output "global_ip_names" {
  value       = [for global_ip in google_compute_global_address.global_ip : global_ip.name]
  description = "Global IP name"
}

output "global_ip_address" {
  value       = [for global_ip in google_compute_global_address.global_ip : global_ip.address]
  description = "Global IP name"
}

