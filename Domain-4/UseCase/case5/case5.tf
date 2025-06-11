# resource "aws_iam_user" "lb" {
#   name = "user-alice"
# }

# resource "aws_security_group" "sg" {
#   name = "demo-sg"
# }

module "iam" {
    source = "./modules/iam"
}

module "sg" {
    source = "./modules/sg"
}

moved {
  from = aws_iam_user.lb
  to = module.iam.aws_iam_user.lb
}

moved {
  from = aws_security_group.sg
  to = module.sg.aws_security_group.sg
}