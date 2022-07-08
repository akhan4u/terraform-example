resource "aws_iam_user" "users" {
  for_each = toset(var.iam_users)
  name     = each.key
  path     = "/cloud_users/"
}

resource "aws_iam_user_group_membership" "this" {
  for_each = toset(var.iam_users)
  user     = aws_iam_user.users[each.key].name
  groups   = [aws_iam_group.terraform_batch.name]
}
