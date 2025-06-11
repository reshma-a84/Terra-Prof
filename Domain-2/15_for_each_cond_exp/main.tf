# for for_each with type map, you can call things like each.value and each.key
variable "mymap" {
  default = {
    dev = "ami-123"
    prod = "ami-456"
  }
}

resource "aws_instance" "web" {
  for_each = var.mymap
  ami = each.value
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}