resource "aws_iam_group" "admin_group" {
  name = var.admin_group_name
}

resource "aws_iam_user" "admin_users" {
  for_each = try(var.admin_users, [])
  name     = each.value
}

resource "aws_iam_user_group_membership" "admin_group_users" {
  for_each = try(var.admin_users, [])
  user     = each.value
  groups   = [aws_iam_group.admin_group.name]

  depends_on = [
    aws_iam_user.admin_users
  ]
}

resource "aws_iam_group_policy_attachment" "admin_group_policy_attachment" {
  group      = aws_iam_group.admin_group.name
  policy_arn = var.admin_group_policy_attachment_arn
}


resource "aws_iam_user_login_profile" "logins" {
  for_each                = aws_iam_user.admin_users
  user                    = each.value.name
  password_reset_required = true

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }
}
