output "user_passwords" {
  value = module.aws_iam_groups.user_passwords
  sensitive = true
}