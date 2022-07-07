terraform {
  required_version = "1.2.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.0"
    }

    # datadog = {
    #   source = "DataDog/datadog"
    # }
    # azurerm  = {
    #   source = "hashicorp/azurerm"
    # }

  }
}
