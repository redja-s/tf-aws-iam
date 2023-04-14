variable "admin_users" {
  type        = set(string)
  description = "A set of user names to create in AWS"
}

variable "admin_group_name" {
  type        = string
  description = "Admin group name"
}

variable "admin_group_policy_attachment_arn" {
  type        = string
  description = "Which policy to use for the admin group"
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "pgp_key" {
  type        = string
  description = "Path to PGP public key file"
}