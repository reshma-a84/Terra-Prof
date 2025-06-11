locals {
  csv_data      = csvdecode(file("./ex1.csv"))
  inbound_rule  = [ for rule in local.csv_data : rule if rule.direction == "in"]
  outbound_rule = [ for rule in local.csv_data : rule if rule.direction == "out"]
  for_each = { for data in local.outbound_rule : data.name => data }
}

output "csv" {
#   value = local.inbound_rule
  value = local.for_each
}

resource "aws_security_group" "example" {
  name = "exercise-1"
  tags = {
    Name = "exercise-1"
  }

}

resource "aws_vpc_security_group_ingress_rule" "example" {

  for_each      = { for data in local.inbound_rule : data.name => data }
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = each.value.cidr_block
  from_port   = each.value.port
  ip_protocol = each.value.protocol
  to_port     = each.value.port
}

resource "aws_vpc_security_group_egress_rule" "example" {
  for_each = { for data in local.outbound_rule : data.name => data }
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = each.value.cidr_block
  from_port   = each.value.port
  ip_protocol = each.value.protocol
  to_port     = each.value.port
}