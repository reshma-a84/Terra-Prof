
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
    key    = "hands-on/terraform-professional-cert"
    region = "us-east-1"

  }
}

# provider "aws" {
#   region  = var.region
#   profile = var.profile

#   default_tags {
#     tags = {
#       Environment = "Learn"
#       Service     = "Study"
#     }
#   }
# }
