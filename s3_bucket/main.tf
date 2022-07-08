resource "aws_s3_bucket" "training_bucket" {
  bucket = var.bucket_name
  tags = {
    team              = var.team
    terraform_managed = var.terraform_managed
  }
}

resource "aws_s3_bucket_versioning" "training_bucket" {
  bucket = aws_s3_bucket.training_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
