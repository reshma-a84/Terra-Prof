resource "local_file" "new-line" {
    content = "the path is \nUsers\nreshu"
    filename = "newline.txt"
}