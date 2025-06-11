resource "aws_autoscaling_group" "my-auto-scaling-group" {
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  availability_zones = ["us-east-1a"]
 
  launch_template {
    id      = aws_launch_template.my-launch-template.id
    version = "$Latest"
  }
}