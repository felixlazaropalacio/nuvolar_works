variable "project" {
  type        = string
  description = "The project in which the resource belongs"
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