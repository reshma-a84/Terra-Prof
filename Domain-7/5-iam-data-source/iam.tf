data "aws_iam_policy_document" "example" {
    statement {
      actions = ["ec2:Describe*"]
      effect = "Allow"
      resources = ["*"]
    }
  
}

resource "aws_iam_policy" "example_policy" {
  name = "data_source_policy"
  policy = data.aws_iam_policy_document.example.json
}