resource "local_file" "heredoc" {
    filename = "heredoc.txt"
    content = <<EOT
    This is Line 1
        This is Line 2
    This is Line 3
    EOT  
}