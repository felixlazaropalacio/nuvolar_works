variable "project" {
  type        = string
  description = "The ID of the project"
}

variable "region" {
  type        = string
  description = "Default region for resources within the project"
}

variable "credentials-file" {
  type        = string
  description = "Credentials file path"
}

variable "apis" {
  type        = list(string)
  description = "A list of Google Cloud services to activate"
}

variable "service-accounts" {
  type = list(object({
    account-id   = string
    display-name = string
    description  = string
    disabled     = bool
  }))
  description = "A list of service accounts to create"
}

variable "iam-members" {
  type = list(object({
    role   = string
    member = string
  }))
  description = "A list of IAM members to create"
}

variable "networks" {
  type = list(object({
    name                            = string
    routing-mode                    = string
    auto-create-subnetworks         = bool
    delete-default-routes-on-create = bool
    mtu                             = number
    subnetworks                     = list(object({
      name                = string
      region              = string
      ip-cidr-range       = string
      secondary-ip-ranges = list(object({
        ip-cidr-range = string
        range-name    = string
      }))
      private-ip-google-access   = bool
      private-ipv6-google-access = string
    }))
    firewall-rules = list(object({
      name          = string
      source-ranges = list(string)
      target-tags   = list(string)
      allow         = list(object({
        ports    = list(string)
        protocol = string
      }))
      deny = list(object({
        ports    = list(string)
        protocol = string
      }))
    }))

    service-connection = list(object({
      connection = object({
        network        = string
        service        = string
        reserved_peering_ranges     = list(string)
      })
      peering-routes = object({
        network        = string
        import_custom_routes     = bool
        export_custom_routes     = bool
      })
    }))

  }))

  description = "A list of VPC networks to create"
}

variable "addresses" {
  type = list(object({
    name          = string
    description   = string
    address-type  = string
    network-tier  = string
    prefix-length = string
  }))
  description = "A list of addresses to create"
}

variable "global-addresses" {
  type = list(object({
    name          = string
    address-type  = string
    network       = string
    prefix-length = number
  }))
  description = "A list of global addresses to create"
}

variable "gke" {
  type = object({
    name                        = string
    node-locations              = list(string)
    initial-node-count          = number
    node-version                = string
    enable-intranode-visibility = bool
    network                     = string
    subnetwork                  = string
    subnetwork-region           = string
    networking-mode             = string
    cluster-ipv4-cidr-block     = string
    services-ipv4-cidr-block    = string
    enable-autoscaling          = bool
    database-encryption-state   = string
    enable-shielded-nodes       = bool
    release-channel             = string
    node-pool                   = object({
      name                          = string
      max-pods-per-node             = number
      node-count                    = number
      autoscaling-min-node-count    = number
      autoscaling-max-node-count    = number
      management-auto-repair        = bool
      management-auto-upgrade       = bool
      upgrade-max-surge             = number
      upgrade-max-unavailable       = number
      node-image-type               = string
      node-disk-size-gb             = number
      node-disk-type                = string
      node-machine-type             = string
      node-preemptible              = bool
      node-disable-legacy-endpoints = bool
      node-zones                    = list(string)
    })
  })
  description = "GKE cluster settings"
}