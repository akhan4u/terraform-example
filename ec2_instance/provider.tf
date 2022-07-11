provider "aws" {
  region  = var.aws_region
  profile = "test"
}

provider "tls" {
}
