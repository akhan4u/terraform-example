resource "aws_s3_bucket" "remote_state_bucket" {
  bucket = "remote-state-bucket-demo1"
  tags = {
    "terraform_managed" = "true"
    "team"              = "devops"
  }
}
