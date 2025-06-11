locals {
  csv_data = csvdecode(file("./ex3.csv"))

  #    build a map to process the csv data
  processed_data = [for data in local.csv_data : {
    name       = data.name
    direction  = data.direction
    protocol   = data.protocol
    cidr_block = data.cidr_block
    from_port  = can (regex("-", data.port)) ? split("-", data.port)[0]: data.port
    to_port    = can (regex("-", data.port)) ? split("-", data.port)[1]: data.port
  }]

   for_each = { for index, data in local.processed_data : index => data }
}

output "ex3-out" {
#   value = local.processed_data
    value = local.for_each
}

resource "aws_security_group" "example" {
  name = "exercise-3"
  tags = {
    Name = "exercise-3"
  }

}

resource "aws_vpc_security_group_ingress_rule" "example" {

# build a map first to process the creation of data for the different security groups
# using index lets the map have a unique key

  for_each = { for index, data in local.processed_data : index => data }
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = each.value.cidr_block
  ip_protocol = each.value.protocol
  from_port   = each.value.from_port
  to_port     = each.value.to_port
}