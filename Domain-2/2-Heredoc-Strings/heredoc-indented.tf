resource "local_file" "heredoc_indented" {
    filename = "indented.txt"
    content = <<-EOT
    This is Line 1
        This is Line 2
    This is Line 3
    EOT  
}