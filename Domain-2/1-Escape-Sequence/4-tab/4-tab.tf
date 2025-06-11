resource "local_file" "tab" {
    content = "Item 1:\tValue 1\nItem 2:\tValue 2"
    filename = "tab.txt"
}