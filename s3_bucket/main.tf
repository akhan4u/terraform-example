resource "aws_s3_bucket" "training_bucket" {
  bucket = "demo1-bucket-testing"
  tags = {
    team              = "devops"
    terraform_managed = true
  }
}

resource "aws_s3_bucket_versioning" "training_bucket" {
  bucket = aws_s3_bucket.training_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
