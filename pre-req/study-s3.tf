# ****************************************************************
# providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }
}

# ****************************************************************
resource "random_string" "random_name" {
  special = false
  upper   = false
  length  = 7
}

locals {
  prefix = random_string.random_name.id
}
# ****************************************************************

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "${local.prefix}-s3-tfstate-bucket"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.tfstate_bucket.bucket
}
