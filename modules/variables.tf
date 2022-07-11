variable "bucket_name" {
  type    = string
  default = "aws_bucket_21133232"
}

variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "environment" {
  description = "Specify the Environment"
  type        = string
  default     = "development"
}

variable "instance_name" {
  description = "Defines the name of EC2 Instance"
  type        = string
  default     = "insite"
}

variable "instance_public" {
  description = "Determines if instance is public"
  type        = bool
  default     = true
}

variable "instance_type" {
  description = "Define EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "root_ebs_size" {
  description = "Size of root EBS volume in Gib"
  type        = number
  default     = 50
}

variable "root_ebs_type" {
  description = "Type of the EBS volume"
  type        = string
  default     = "gp3"
}
