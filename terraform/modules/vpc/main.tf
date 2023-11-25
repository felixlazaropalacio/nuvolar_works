module "vpc_network" {
  source = "./modules/network"

  project                         = var.project
  name                            = var.name
  routing-mode                    = var.routing-mode
  auto-create-subnetworks         = var.auto-create-subnetworks
  delete-default-routes-on-create = var.delete-default-routes-on-create
  mtu                             = var.mtu
}

module "vpc_subnetworks" {
  source = "./modules/subnetwork"
  count  = length(var.subnetworks)

  project                    = var.project
  name                       = element(var.subnetworks, count.index).name
  region                     = element(var.subnetworks, count.index).region
  network                    = module.vpc_network.network_name
  ip-cidr-range              = element(var.subnetworks, count.index).ip-cidr-range
  secondary-ip-ranges        = element(var.subnetworks, count.index).secondary-ip-ranges
  private-ip-google-access   = element(var.subnetworks, count.index).private-ip-google-access
  private-ipv6-google-access = element(var.subnetworks, count.index).private-ipv6-google-access
}

module "vpc_firewall_rules" {
  source = "./modules/firewall"
  count  = length(var.firewall-rules)

  project       = var.project
  name          = element(var.firewall-rules, count.index).name
  network       = module.vpc_network.network_name
  source-ranges = element(var.firewall-rules, count.index).source-ranges
  target-tags   = element(var.firewall-rules, count.index).target-tags
  allow         = element(var.firewall-rules, count.index).allow
  deny          = element(var.firewall-rules, count.index).deny
}

module "service_connection" {
  source = "./modules/service-connection"
  count  = length(var.service-connection)

  connection = element(var.service-connection, count.index).connection
  peering-routes = element(var.service-connection, count.index).peering-routes

}