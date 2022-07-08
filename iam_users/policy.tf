resource "aws_iam_policy" "group_policy" {
  name        = "terraform-group-policy"
  path        = "/"
  description = "IAM policy for the terraform group"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::demo1-bucket-testing"
      },
    ]
  })
}

resource "aws_iam_policy" "manage_own_credentials" {
  name        = "manage-credential-policy"
  path        = "/"
  description = "IAM policy for the terraform group to manage own credentials"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:CreateAccessKey",
          "iam:DeleteAccessKey",
          "iam:UpdateAccessKey",
          "iam:ListAccessKeys",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:iam::*:user/$${aws:username}"
      },
    ]
  })
}

resource "aws_iam_group_policy_attachment" "s3_bucket" {
  group      = aws_iam_group.terraform_batch.name
  policy_arn = aws_iam_policy.group_policy.arn
}

resource "aws_iam_group_policy_attachment" "managing_credentials" {
  group      = aws_iam_group.terraform_batch.name
  policy_arn = aws_iam_policy.manage_own_credentials.arn
}
