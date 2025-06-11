data "aws_subnets" "current" {
}

output "subnet_details" {
  value = data.aws_subnets.current.*
}