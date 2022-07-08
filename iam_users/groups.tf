resource "aws_iam_group" "terraform_batch" {
  name = "terraform"
  path = "/batch1/"
}
