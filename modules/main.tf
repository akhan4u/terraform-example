module "s3_bucket" {
  # PATH TO LOCAL DIRECTORY
  # source      = "./custom_modules"
  # PATH TO GIT REPOSITORY
  source     = "git@github.com:akhan4u/terraform-module-example.git//modules/s3?ref=s3_module"
  bucket     = var.bucket_name
  aws_region = var.aws_region
}
