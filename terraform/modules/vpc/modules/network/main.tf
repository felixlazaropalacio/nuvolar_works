resource "google_compute_network" "vpc_network" {
  project = var.project
  name = var.name

  routing_mode = var.routing-mode
  auto_create_subnetworks = var.auto-create-subnetworks
  delete_default_routes_on_create = var.delete-default-routes-on-create
  mtu = var.mtu // Ojo: The minimum value for this field is 1460 and the maximum value is 1500 bytes.
}