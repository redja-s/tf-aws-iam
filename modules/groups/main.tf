resource "aws_iam_group" "groups" {
    for_each = var.aws_iam_group_names

    name = each.value
}