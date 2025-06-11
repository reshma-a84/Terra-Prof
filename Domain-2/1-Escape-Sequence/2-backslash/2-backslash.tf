resource "local_file" "backslash" {
    content = "the path is \\Users\\reshu"
    filename = "backslash.txt"
}