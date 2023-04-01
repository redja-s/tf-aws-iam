resource "aws_iam_group" "groups" {
    for_each = var.aws_iam_groups

    name = each.value.name
}