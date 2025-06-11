locals {
  csv_data  = csvdecode(file("./ex4-1.csv"))
  json_data = jsondecode(file("./app-1.json"))

  processed_data = { for index, data in local.csv_data : index => {
    direction  = data.direction
    protocol   = data.protocol
    cidr_block = local.json_data[data.cidr_block]
    port       = data.port
  } }
}

output "data" {
  value = local.processed_data
}


resource "aws_security_group" "example" {
  name = "exercise-4"
  tags = {
    Name = "exercise-4"
  }

}

resource "aws_vpc_security_group_ingress_rule" "example" {

  for_each = local.processed_data 
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = each.value.cidr_block
  ip_protocol = each.value.protocol
  from_port   = each.value.port
  to_port     = each.value.port
}