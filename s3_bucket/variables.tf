variable "bucket_name" {
  description = "Specifies the name of the s3 bucket resource"
  type        = string
}

variable "team" {
  description = "Specifies the name of the team for the resource"
  type        = string
  default     = "devops"
}

variable "terraform_managed" {
  description = "Specifies if the resource is managed with terraform"
  type        = bool
  default     = true
}
