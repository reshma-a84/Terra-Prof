# Load the JSON file using file() and jsondecode()
locals {
  json_data = jsondecode(file("./data.json"))

#    for_each = { for index, data in local.processed_data : index => data }
   processed_data = { for server in local.json_data.servers : server.name => server }
    
}


output "json_out" {
  value = local.processed_data
}