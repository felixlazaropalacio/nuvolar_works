module "gke_cluster" {
  source = "./modules/gke/cluster"

  project                     = var.project
  location                    = var.region
  name                        = var.gke.name
  node-locations              = var.gke.node-locations
  initial-node-count          = var.gke.initial-node-count
  node-version                = var.gke.node-version
  enable-intranode-visibility = var.gke.enable-intranode-visibility
  network                     = "projects/${var.project}/global/networks/${var.gke.network}"
  subnetwork                  = "projects/${var.project}/regions/${var.gke.subnetwork-region}/subnetworks/${var.gke.subnetwork}"
  networking-mode             = var.gke.networking-mode
  cluster-ipv4-cidr-block     = var.gke.cluster-ipv4-cidr-block
  services-ipv4-cidr-block    = var.gke.services-ipv4-cidr-block
  enable-autoscaling          = var.gke.enable-autoscaling
  database-encryption-state   = var.gke.database-encryption-state
  enable-shielded-nodes       = var.gke.enable-shielded-nodes
  release-channel             = var.gke.release-channel
}

module "gke_cluster_node_pool" {
  source = "./modules/gke/node-pool"

  project                       = var.project
  location                      = var.region
  name                          = var.gke.node-pool.name
  node-locations                = var.gke.node-locations
  cluster                       = module.gke_cluster.gke_cluster_name
  node-count                    = var.gke.node-pool.node-count
  node-version                  = var.gke.node-version
  autoscaling-min-node-count    = var.gke.node-pool.autoscaling-min-node-count
  autoscaling-max-node-count    = var.gke.node-pool.autoscaling-max-node-count
  management-auto-repair        = var.gke.node-pool.management-auto-repair
  management-auto-upgrade       = var.gke.node-pool.management-auto-upgrade
  upgrade-max-surge             = var.gke.node-pool.upgrade-max-surge
  upgrade-max-unavailable       = var.gke.node-pool.upgrade-max-unavailable
  node-image-type               = var.gke.node-pool.node-image-type
  node-disk-size-gb             = var.gke.node-pool.node-disk-size-gb
  node-disk-type                = var.gke.node-pool.node-disk-type
  node-machine-type             = var.gke.node-pool.node-machine-type
  node-preemptible              = var.gke.node-pool.node-preemptible
  node-disable-legacy-endpoints = var.gke.node-pool.node-disable-legacy-endpoints
  node-zones                    = var.gke.node-pool.node-zones
}