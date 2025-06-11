//1. Create an IAM role
resource "aws_iam_role" "my-role" {
    name               = "my-role"
    assume_role_policy = file("role.json")
}


resource "aws_iam_role_policy_attachment" "policy-attach" {
  role = aws_iam_role.my-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}