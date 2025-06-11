variable "matrix_config" {
  type = list(list(string))
  default = [
     [ "a1", "a2","a3" ],
     ["b1", "b2", "b3"],
     ["c1", "c2"] 
     ]
}

output "out_matrix" {
  value = length(var.matrix_config)
}
output "out_matrix_config" {
    value = var.matrix_config[1][1]
  
}

### Index of list
variable "index_list" {
  type = list
  default = ["apple", "banana", "orange", "guava"]
}

output "out_index_list" {
  value = var.index_list[1]
}