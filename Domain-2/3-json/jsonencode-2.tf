# locals {
#   json_string = <<EOT
#   {
#     "name": "Mr A",
#     "age": 30,
#     "city": "Mumbai"
#   }
#   EOT

#   decoded_json = jsondecode(local.json_string)
# }

# output "decode" {
#     value = local.decoded_json["name"]
# }