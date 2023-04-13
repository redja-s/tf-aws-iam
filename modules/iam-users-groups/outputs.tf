output "user_passwords" {
  value = {
    for user_key, user_value in aws_iam_user_login_profile.logins : user_key => user_value.password
  }
}