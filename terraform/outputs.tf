output "global_addresses_map" {
  value = "${zipmap(module.global-addresses.global_ip_names, module.global-addresses.global_ip_address)}"
}

output "regional_addresses_map" {
  value = "${zipmap(module.addresses.regional_ip_names, module.addresses.regional_ip_address)}"
}

output "enabled_apis" {
  description = "Enabled APIs in the project"
  value       = module.gcp-required-apis.enabled_apis 
}

output "gke_cluster_name" {
  value = module.gke_cluster.gke_cluster_name
}

output "network_name" {
    value = module.vpc[*].network_name
}

output "network" {
    value = module.vpc[*].network
}

output "subnetwork_name" {
    value = module.vpc[*].subnetwork_name
}