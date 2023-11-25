resource "google_service_account" "service_account" {
  project  = var.project
  for_each = {for el in var.service-accounts : el["account-id"] => el}

  account_id   = each.value["account-id"]
  display_name = each.value["display-name"]
  description  = each.value["description"]
  disabled     = each.value["disabled"]
}