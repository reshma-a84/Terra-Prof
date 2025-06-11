resource "aws_iam_user" "this" {
  name = "iam-user-${count.index}"
  count = 5
}