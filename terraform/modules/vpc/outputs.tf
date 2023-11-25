output "network_name" {
    value = module.vpc_network.network_name
}

output "network" {
    value = module.vpc_network.network
}

output "subnetwork_name" {
    value = module.vpc_subnetworks[*].subnetwork_name
}