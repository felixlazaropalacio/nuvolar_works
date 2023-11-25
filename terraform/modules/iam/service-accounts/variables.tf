variable "project" {
  type        = string
  description = "The ID of the project that the service account will be created in"
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