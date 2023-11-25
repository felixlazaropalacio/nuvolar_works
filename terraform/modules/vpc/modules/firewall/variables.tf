variable "project" {
  type        = string
  description = "The ID of the project in which the resource belongs"
}

variable "name" {
  type        = string
  description = "Name of the resource"
}

variable "network" {
  type        = string
  description = "The name or self_link of the network to attach this firewall to"
}

variable "source-ranges" {
  type        = list(string)
  description = "If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges"
}

variable "target-tags" {
  type        = list(string)
  description = " A list of instance tags indicating sets of instances located in the network that may make network connections as specified in allowed"
}

variable "allow" {
  type = list(object({
    ports    = list(string)
    protocol = string
  }))
  description = "The list of ALLOW rules specified by this firewall"
}

variable "deny" {
  type = list(object({
    ports    = list(string)
    protocol = string
  }))
  description = "The list of DENY rules specified by this firewall"
}