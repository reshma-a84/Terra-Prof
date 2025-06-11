# for managing multiple sets of similar objects - like a fixed pool of ec2 instances
# for same configurations and may be different names use meta-argument "count"
# for similar resource blocks and slightly different configurations use "for_each"
variable "use_names" {
  type = set(string)
  default = [ "alice", "bob", "john" ]
}

resource "aws_iam_user" "this" {
  for_each = var.use_names
  name = each.value
}