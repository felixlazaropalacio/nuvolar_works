variable "project" {
  type        = string
  description = "The project in which the resource belongs"
}

variable "region" {
  type        = string
  description = "The region in which the created address reside"
}

variable "addresses" {
  type = list(object({
    name          = string
    description   = string
    address-type  = string
    network-tier  = string
    prefix-length = number
  }))
  description = "A list of addresses to create"
}