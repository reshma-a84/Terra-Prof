data "aws_ami" "my-ami"{
    most_recent = true
    owners = ["amazon"]

    filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64*"]
  }
}

# output "ami-id" {
#     value = data.aws_ami.my-ami.id  
# }