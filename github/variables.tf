variable "repo_details" {
  type        = map(any)
  description = "Github Repository details"
}

# Getting Key value from variable of Map type with lookup() function : lookup(var.repo_details, var.key, error)
# Example Lookup of AMI, with Region as Key and AMI Id as value
#       ami = "lookup(var.repo_details, var.region, error)"
# OR    ami = var.amis[var.region]
#
# repo_details = {

# demo_repo1 = {
#   default_branch         = "main"
#   delete_branch_on_merge = true
#   description            = "This is a demo project repo"
#   topics                 = ["terraform", "devops"]
#   visibility             = "private"
# }

# demo_repo2 = {
#   default_branch         = "main"
#   delete_branch_on_merge = false
#   description            = "This is a demo project repo"
#   topics                 = ["terraform", "devops", "learnings"]
#   visibility             = "private"
# }

# # Example:
# name_of_repository = {
#   description            = "value"
#   visibility             = "public/private"
#   delete_branch_on_merge = "true/false" # Default: false
#   default_branch         = "master/main"
#   topics                 = "List of topics"
# }

# }
