variable "iam_users" {
  description = "The List of IAM Users to be created"
  type        = list(any)
}

variable "team" {
  type    = string
  default = "devops"
}

variable "environment" {
  type    = string
  default = "development"
}

variable "tf_managed" {
  type    = bool
  default = true
}
