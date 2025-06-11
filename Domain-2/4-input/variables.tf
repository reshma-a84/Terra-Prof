
# variable "region" {
#   type    = string
#   default = "us-east-1"

# }

# variable "profile" {
#   type    = string
#   default = "aws-2025"
# }

variable "dbpassword" {
  type = string
  description = "Password to connect"

  validation {
    condition = length(var.dbpassword) >= 12
    error_message = "DB pwd must be at least 12 characters"
  }
}

variable "instance_type" {
  type = string
  validation {
    condition = contains(["t3.micro", "t3.medium", "m5.large"], var.instance_type)
    error_message = "Invalid instance type. Choose from the following, t3.micro, t3.medium or m5.large"
  }
}
