resource "google_compute_address" "ip" {
  project  = var.project
  region   = var.region
  for_each = {for el in var.addresses : el["name"] => el}

  name         = each.value["name"]
  description  = each.value["description"]
  address_type = each.value["address-type"]

  network_tier  = each.value["network-tier"]
  prefix_length = each.value["prefix-length"]
}