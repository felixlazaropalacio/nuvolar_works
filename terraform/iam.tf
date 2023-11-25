module "service-accounts" {
  source = "./modules/iam/service-accounts"

  project          = var.project
  service-accounts = var.service-accounts
}

module "members" {
  source = "./modules/iam/members"

  project = var.project
  iam-members = var.iam-members
}
