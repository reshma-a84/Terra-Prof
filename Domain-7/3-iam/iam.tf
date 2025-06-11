resource "aws_iam_user" "lb" {
  name = "terraform-exam"
}

//password
resource "aws_iam_user_login_profile" "example" {
  user    = aws_iam_user.lb.name
  password_reset_required = true
}

resource "aws_iam_access_key" "lb" {
  user    = aws_iam_user.lb.name
}