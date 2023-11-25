variable "project" {
  type        = string
  description = "The GCP project you want to enable APIs on"
}

variable "apis" {
  type        = list(string)
  description = "The list of apis to activate within the project"
  default = []
}

variable "disable-on-destroy" {
  type = bool
  description = "If true, disable the service when the Terraform resource is destroyed"
}

variable "disable-dependent-services" {
  type = bool
  description = "If true, services that are enabled and which depend on this service should also be disabled when this service is destroyed"
}