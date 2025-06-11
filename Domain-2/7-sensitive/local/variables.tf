variable "password" {
  default = "mysecretpassw0rd"
  sensitive = true
}

resource "local_file" "file"{
    content = var.password
    filename = "pwd.txt"
}
