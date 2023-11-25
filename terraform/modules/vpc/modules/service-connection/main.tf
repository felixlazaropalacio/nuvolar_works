resource "google_service_networking_connection" "google_managed_services" {
  network                 = var.connection.network
  service                 = var.connection.service
  reserved_peering_ranges = var.connection.reserved_peering_ranges
}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  peering              = google_service_networking_connection.google_managed_services.peering
  network              = var.peering-routes.network
  import_custom_routes = var.peering-routes.import_custom_routes
  export_custom_routes = var.peering-routes.export_custom_routes
}