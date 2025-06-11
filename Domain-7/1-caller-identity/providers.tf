# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.0"
    }
  }

  backend "s3" {
    bucket = "hruhltp-s3-tfstate-bucket"
    key    = "hands-on/terraform-professional-cert/domain-7"
    region = "us-east-1"

  }
}