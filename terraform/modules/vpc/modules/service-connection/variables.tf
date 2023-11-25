variable "connection" {
  type = object({
        network        = string
        service        = string
        reserved_peering_ranges     = list(string)
      })
  description = "A list of Service Networkin Connections"
}

variable "peering-routes" {
    type = object({
      network        = string
      import_custom_routes     = bool
      export_custom_routes     = bool
    })
    description = "A list of Peering Routes"
}
