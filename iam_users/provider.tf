provider "aws" {
  region  = "us-east-1"
  profile = "default"
  default_tags {
    tags = {
      environment       = var.environment
      terraform_managed = var.tf_managed
      team              = var.team
    }
  }
}
