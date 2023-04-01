resource "aws_iam_group" "groups" {
    for_each = var.group_names

    name = each.value
}

resource "aws_iam_user" "admin_users" {
    for_each = var.
}