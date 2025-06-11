#### Eg 1: List of List

variable "list_of_list" {
  type = list(list(string))
  default = [ [ "alice","wonderland" ],["busan"],["Jeju"] ]
}

output "my_list_of_list" {
  value = var.list_of_list
}


#### Eg 2: List of Map
variable "list_of_map" {
  type = list(map(string))
  default = [ {
    user = "alice",
    email = "alice@wonderland"  } ,
    {
        user = "clooney",
        email = "clooney@wonderland"
    }]
}
output "my_list_of_map" {
  value = var.list_of_map
}

#### Eg 3: May of Maps
variable "map_of_maps" {
  type = map(map(string))
  default = {
    dev = {
      instance_type = "t2.micro"
      Name = "dev-server"
    },
    prod = {
        instance_type = "m5.large"
        Name = "prod-server"
    }
  }
}
output "out_map_of_maps" {
  value = var.map_of_maps
}

#### Eg 4: May of Lists
variable "map_of_lists" {
    type = map(list(any))
    default = {
      fruits = ["apple","oranges","grapes"  ],
      vegetables = ["potato","beans"]
    }
}
output "out_map_of_lists" {
  value = var.map_of_lists
}

#### Eg 4: List of objects
variable "list_of_objects" {
  type = list(object({
    name = string
    age = number
    tags = map(string) 
  }))
  default = [ {
    name = "alice"
    age = 44
    tags = {
      "env" = "dev",
      "name" = "alice"
    }
  } ]
}
output "out_list_of_objects" {
    value = var.list_of_objects
  
}