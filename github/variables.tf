variable "repo_details" {
  type        = map(any)
  description = "Github Repository details"
}

# Getting Key value from variable of Map type with lookup() function : lookup(var.repo_details, var.key, error)
# Example Lookup of AMI, with Region as Key and AMI Id as value
#       ami = "lookup(var.repo_details, var.region, error)"
# OR    ami = var.amis[var.region]

