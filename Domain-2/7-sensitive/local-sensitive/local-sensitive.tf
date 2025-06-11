resource "local_sensitive_file" "sensitive_file" {
  content = "mysecretivepassword1"
  filename = "mysecretpassword.txt"
}

output "pass" {
  value = local_sensitive_file.sensitive_file.content
  sensitive = true
}