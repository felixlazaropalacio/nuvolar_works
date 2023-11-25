locals {
  autoscaling = var.autoscaling-min-node-count != null && var.autoscaling-max-node-count != null ? [""] : []
}

resource "google_container_node_pool" "gke_cluster_node_pool" {
  project = var.project
  name = var.name
  location = var.location
  node_locations = var.node-zones

  cluster = var.cluster
  //  initial_node_count = "1"
  node_count = var.node-count

  dynamic "autoscaling" {
    for_each = toset(local.autoscaling)

    content {
      min_node_count = var.autoscaling-min-node-count
      max_node_count = var.autoscaling-max-node-count
    }
  }

  management {
    auto_repair = var.management-auto-repair
    auto_upgrade = var.management-auto-upgrade
  }

  upgrade_settings {
    max_surge = var.upgrade-max-surge
    max_unavailable = var.upgrade-max-unavailable
  }

  node_config {
    disk_size_gb = var.node-disk-size-gb
    disk_type = var.node-disk-type
    machine_type = var.node-machine-type
    preemptible = var.node-preemptible

    metadata = {
      disable-legacy-endpoints = var.node-disable-legacy-endpoints
    }
  }
}