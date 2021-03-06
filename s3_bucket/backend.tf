# Terraform Standard Backend S3 (with locking via DynamoDB)
terraform {
  backend "s3" {
    bucket  = "remote-state-bucket-demo1"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}
