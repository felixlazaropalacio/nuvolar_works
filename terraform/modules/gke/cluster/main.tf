resource "google_container_cluster" "gke_cluster" {
  project = var.project
  name = var.name
  location = var.location
  node_locations = var.node-locations

  initial_node_count = var.initial-node-count
  enable_intranode_visibility = var.enable-intranode-visibility


  network = var.network
  subnetwork = var.subnetwork
  networking_mode = var.networking-mode

  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.cluster-ipv4-cidr-block
    services_ipv4_cidr_block = var.services-ipv4-cidr-block
  }

  cluster_autoscaling {
    enabled = var.enable-autoscaling
  }

  database_encryption {
    state = var.database-encryption-state
  }

  enable_shielded_nodes = var.enable-shielded-nodes

  release_channel {
    channel = var.release-channel
  }
}

