variable "terraform_role_name" {
  type = string
  description = "The name of the Terraform role name in AWS, used in GitHub Actions"
}

variable "terraform_apply_permissions_policy_name" {
  type = string
  description = "Name of the policy that is attached to the Terraform role"
}