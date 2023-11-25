variable "project" {
  type        = string
  description = ""
}

variable "iam-members" {
  type = list(object({
    role   = string
    member = string
  }))
  description = "A list of IAM members"
}