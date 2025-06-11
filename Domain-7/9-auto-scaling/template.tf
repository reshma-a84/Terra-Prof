resource "aws_launch_template" "my-launch-template" {
name = "my-launch-template"
image_id = data.aws_ami.my-ami.id
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.my-sg.id]
}