module "iam" {
  source = "./modules/iam"
}

moved {
  from = module.iam.aws_iam_user.this
  to = module.iam.aws_iam_user.this[1]
}