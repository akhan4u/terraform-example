module "s3_bucket" {
  # PATH TO LOCAL DIRECTORY
  # source      = "./custom_modules"
  # PATH TO GIT REPOSITORY
  source     = "git@github.com:akhan4u/terraform-module-example.git//modules/s3?ref=main"
  bucket     = var.bucket_name
  aws_region = var.aws_region
}

module "ec2_instance" {
  source          = "git@github.com:akhan4u/terraform-module-example.git//modules/ec2/?ref=ec2_module"
  aws_region      = var.aws_region
  environment     = var.environment
  instance_name   = var.instance_name
  instance_public = var.instance_public
  instance_type   = var.instance_type
  root_ebs_size   = var.root_ebs_size
  root_ebs_type   = var.root_ebs_type
}
