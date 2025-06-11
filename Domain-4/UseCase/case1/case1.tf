resource "aws_instance" "case" {
  ami           = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  count         = 3

  tags = {
    Name = "HelloWorld"
  }
}

# moved {
#   from = aws_instance.case1
#   to   = aws_instance.case
# }

moved {
  from = aws_instance.case1[0]
  to   = aws_instance.case[0]
}

moved {
  from = aws_instance.case1[1]
  to   = aws_instance.case[1]
}
moved {
  from = aws_instance.case1[2]
  to   = aws_instance.case[2]
}
