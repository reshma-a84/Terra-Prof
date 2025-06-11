variable "my-list" {
  type = list(any)
  # default = ["abc", "def", "xyz"]
  default = [1, 3, 5]
}

output "out_list" {
  value = var.my-list
}

variable "my_map" {
  #   type = map(string) both the types of declarations work
  type = map(any)
  default = {
    "Name"  = "Seo Jun",
    "Place" = "Seoul"
  }
}
output "out_map" {
  value = var.my_map
}

variable "departments" {
  description = "List of departments with employee details"
  type = list(object({
    name      = string
    employees = list(object({
      name  = string
      role  = string
      salary = number
    }))
  }))
  default = [
    {
      name      = "Engineering"
      employees = [
        {
          name   = "Alice"
          role   = "Engineer"
          salary = 80000
        },
        {
          name   = "Bob"
          role   = "Senior Engineer"
          salary = 95000
        }
      ]
    },
    {
      name      = "HR"
      employees = [
        {
          name   = "Charlie"
          role   = "HR Manager"
          salary = 60000
        }
      ]
    }
  ]
}

output "departments" {
  value = var.departments
}

