## list 
variable "my_list" {
  type = list(any)
  default = [ 1,2,3,4,5,6,7,8,9 ]
}
output "out_list" {
  value = var.my_list
}

##set
variable "my_set" {
  type = set(any)
  default = [ 1,2,3,4,5,1,1,2 ]
}

output "out_set" {
  value = var.my_set
}