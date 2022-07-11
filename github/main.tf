resource "github_repository" "repos" {
  for_each               = var.repo_details
  name                   = each.key
  delete_branch_on_merge = each.value.delete_branch_on_merge
  description            = each.value.description
  topics                 = each.value.topics
  visibility             = each.value.visibility
}
