resource "google_compute_global_address" "global_ip" {
  project  = var.project
  for_each = {for el in var.global-addresses: el["name"] => el}

  name         = each.value["name"]
  address_type = each.value["address-type"]
  prefix_length = each.value["prefix-length"]
  network = each.value["network"]
}