variable "admin_users" {
  type        = set(string)
  description = "Admin users"
}

variable "admin_group_name" {
  type = string
}

variable "admin_group_policy_attachment_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}