resource "google_project_service" "gcp_service_api" {
  project  = var.project
  for_each = toset(var.apis)
  service  = each.key

  disable_on_destroy         = var.disable-on-destroy
  disable_dependent_services = var.disable-dependent-services

  lifecycle {
    ignore_changes = [
        timeouts
    ]
  }
}
