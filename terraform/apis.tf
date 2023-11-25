module "gcp-required-apis" {
  source = "./modules/apis"

  project                    = var.project
  apis                       = var.apis
  disable-on-destroy         = false
  disable-dependent-services = false
}