resource "google_compute_firewall" "firewall_rule" {
  project = var.project

  name          = var.name
  network       = var.network

  source_ranges = var.source-ranges
  target_tags = var.target-tags

  dynamic "allow" {
    for_each = var.allow
    iterator = each

    content {
      ports    = each.value["ports"]
      protocol = each.value["protocol"]
    }
  }

  dynamic "deny" {
    for_each = var.deny
    iterator = each

    content {
      ports    = each.value["ports"]
      protocol = each.value["protocol"]
    }
  }
}