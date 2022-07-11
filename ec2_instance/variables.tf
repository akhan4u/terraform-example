variable "environment" {
  description = "Specify the Environment"
  type        = string
  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Underlying environment must be either of development, staging, production."
  }
}

variable "aws_region" {
  type = string
}

variable "instance_name" {
  description = "Defines the name of EC2 Instance"
  type        = string
}

variable "instance_public" {
  description = "Determines if instance is public"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "Define EC2 Instance type"
  type        = string
  validation {
    condition     = contains(["t2.nano", "t2.micro"], var.instance_type)
    error_message = "Supported instance types are t2.micro and t2.nano."
  }
}

variable "root_ebs_size" {
  description = "Size of root EBS volume in Gib"
  type        = number
}

variable "root_ebs_type" {
  description = "Type of the EBS volume"
  type        = string
}

variable "ec2_details" {
  type        = map(any)
  description = "Details of EC2 Instances"
  default = {
    "us-west-1" = "ami-040a251ee9d7d1a9b" #Ubuntu Focal (20.04)---Region (us-west-1)
    "us-west-2" = "ami-0aab355e1bfa1e72e" #Ubuntu Focal (20.04)---Region (us-west-2)
  }
}

# Getting Key value from variable of Map type with lookup() function : lookup(var.ec2_details, var.key, error)
# Example Lookup of AMI, with Region as Key and AMI Id as value
#       ami = "lookup(var.ec2_details, var.region, error)"
# OR    ami = var.amis[var.region]
