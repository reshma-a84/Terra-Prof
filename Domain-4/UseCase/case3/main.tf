// Enabling for_each for existing resources. Data type for for_each is a map or set
// Here the ami is different for ec2-1 and ec2-2
# resource "aws_instance" "amzlnx" {
#   ami           = "ami-0e449927258d45bc4"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "AmazonLinux"
#   }
# }

# resource "aws_instance" "ubnt" {
#   ami           = "ami-084568db4383264d4"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "Ubuntu"
#   }
# }

locals {
  instance_data = {
    amzlnx = {
      ami           = "ami-0e449927258d45bc4"
      instance_type = "t2.micro"
    }
    ubnt = {
      ami           = "ami-084568db4383264d4"
      instance_type = "t2.micro"
    }
  }
}
resource "aws_instance" "ec2" {
  for_each = local.instance_data
  ami           = each.value.ami
  instance_type = each.value.instance_type
  tags = {
    Name = each.key
  }
}
moved {
  from = aws_instance.amzlnx
  to   = aws_instance.ec2["amzlnx"]
}
moved {
  from = aws_instance.ubnt
  to   = aws_instance.ec2["ubnt"]
}