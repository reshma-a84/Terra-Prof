resource "aws_instance" "tfp-ec2" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
}