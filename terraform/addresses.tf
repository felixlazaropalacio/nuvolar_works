module "addresses" {
  source = "./modules/addresses/regional"

  project   = var.project
  region    = var.region
  addresses = var.addresses
}

module "global-addresses" {
  source = "./modules/addresses/global"

  project          = var.project
  global-addresses = var.global-addresses
}
