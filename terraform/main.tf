terraform {
  backend "gcs" {}
}

provider "google" {
  credentials = file(var.credentials-file)
  project = var.project
  region = var.region
}

provider "google-beta" {
  credentials = file(var.credentials-file)
  project = var.project
  region = var.region
}
