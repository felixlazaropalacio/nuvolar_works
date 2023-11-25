locals {
  members = [for el in var.iam-members : split("@", split(":", el["member"])[1])[0]]
  roles = [for el in var.iam-members : split("/", el["role"])[1]]
}

resource "google_project_iam_member" "iam_member" {
  project = var.project
  for_each = {for idx, el in var.iam-members: "${local.members[idx]}_${local.roles[idx]}" => el}

  role    = each.value["role"]
  member  = each.value["member"]
}