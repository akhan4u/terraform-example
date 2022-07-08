variable "environment" {
  description = "Specify the Environment"
  type        = string
  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Underlying environment must be either of development, staging, production."
  }
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
