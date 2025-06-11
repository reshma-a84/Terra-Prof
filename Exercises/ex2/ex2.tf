locals {
  csv_data      = csvdecode(file("./ex2.csv"))
  inbound_rule  = [ for rule in local.csv_data : rule if rule.direction == "in"]
  outbound_rule = [ for rule in local.csv_data : rule if rule.direction == "out"]
  for_each = { for index, data in local.outbound_rule : index => data }
}

output "csv" {
  value = local.for_each
}

resource "aws_security_group" "example" {
  name = "exercise-2"
  tags = {
    Name = "exercise-2"
  }

}

resource "aws_vpc_security_group_ingress_rule" "example" {

  for_each = { for index, data in local.inbound_rule : index => data }
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = each.value.cidr_block
  from_port   = each.value.port
  ip_protocol = each.value.protocol
  to_port     = each.value.port
}

resource "aws_vpc_security_group_egress_rule" "example" {
  for_each = { for index, data in local.outbound_rule : index => data }
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = each.value.cidr_block
  from_port   = each.value.port
  ip_protocol = each.value.protocol
  to_port     = each.value.port
}