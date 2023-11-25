output "network_name" {
    value = google_compute_network.vpc_network.name
}

output "network" {
    value = google_compute_network.vpc_network.self_link
}