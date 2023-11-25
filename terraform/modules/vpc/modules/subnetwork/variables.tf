variable "project" {
  type = string
  description = "The ID of the project in which the resource belongs"
}

variable "region" {
  type = string
  description = "The GCP region for this subnetwork"
}

variable "name" {
  type = string
  description = "The name of the resource, provided by the client when initially creating the resource"
}

variable "network" {
  type = string
  description = "The network this subnet belongs to"
}

variable "ip-cidr-range" {
  type = string
  description = "The range of internal addresses that are owned by this subnetwork"
}

variable "secondary-ip-ranges" {
  type = list(object({
    ip-cidr-range = string
    range-name = string
  }))
  description = "A list of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges"
}

variable "private-ip-google-access" {
  type = bool
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
}

variable "private-ipv6-google-access" {
  type = string
  description = "The private IPv6 google access type for the VMs in this subnet"
}
