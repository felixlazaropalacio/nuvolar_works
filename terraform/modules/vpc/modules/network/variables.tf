variable "project" {
  type = string
  description = "The ID of the project in which the resource belongs"
}

variable "name" {
  type = string
  description = "Name of the resource. Provided by the client when the resource is created"
}

variable "routing-mode" {
  type = string
  description = "The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnetworks of this network, across regions"
}

variable "auto-create-subnetworks" {
  type = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources"
}

variable "delete-default-routes-on-create" {
  type = bool
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation"
}

variable "mtu" {
  type = number
  description = "Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes"
}