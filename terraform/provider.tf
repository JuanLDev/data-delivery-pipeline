provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.9.8"  # Ensure compatibility with your Terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
