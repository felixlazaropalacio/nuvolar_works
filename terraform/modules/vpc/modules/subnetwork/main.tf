# locals {
#   logs  = var.logs-aggregation-interval != null && var.logs-flow-sampling != null && var.logs-metadata != null ? [""] : []
# }

resource "google_compute_subnetwork" "vpc_subnetwork" {
  project = var.project
  region = var.region
  name = var.name

  network = var.network
  ip_cidr_range = var.ip-cidr-range

  private_ip_google_access = var.private-ip-google-access
  private_ipv6_google_access = var.private-ipv6-google-access
}