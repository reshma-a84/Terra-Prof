# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }

  backend "s3" {
    bucket = "tfpro-practice"
    region = "us-east-1"
    key    = "tfstate/Domain-1/moved"
  }
  required_version = ">= 1.5.0"
}
