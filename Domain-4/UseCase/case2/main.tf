// Enabling count for existing resources
// Here the ami remains the same for ec2-1 and ec2-2 

# resource "aws_instance" "ec2-1" {
#   ami           = "ami-0e449927258d45bc4"
#   instance_type = "t2.micro"
# }

# resource "aws_instance" "ec2-2" {
#   ami           = "ami-0e449927258d45bc4"
#   instance_type = "t2.micro"
# }

resource "aws_instance" "ec2" {
  ami           = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  count         = 2
}

moved {
  from = aws_instance.ec2-1
  to   = aws_instance.ec2[0]
}

moved {
  from = aws_instance.ec2-2
  to   = aws_instance.ec2[1]
}
