module "vpc" {
  source = "./modules/vpc"
  count  = length(var.networks)

  project                         = var.project
  name                            = element(var.networks, count.index).name
  routing-mode                    = element(var.networks, count.index).routing-mode
  auto-create-subnetworks         = element(var.networks, count.index).auto-create-subnetworks
  delete-default-routes-on-create = element(var.networks, count.index).delete-default-routes-on-create
  mtu                             = element(var.networks, count.index).mtu

  subnetworks = element(var.networks, count.index).subnetworks
  firewall-rules = element(var.networks, count.index).firewall-rules
  service-connection = element(var.networks, count.index).service-connection
}