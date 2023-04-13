terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "state-bucket-292030"
    key    = "tf-aws-iam.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

module "aws_iam_roles" {
  source = "./modules/iam-roles"

  terraform_role_name                     = "aws-terraform-role"
  terraform_apply_permissions_policy_name = "aws-terraform-policy"
}

module "aws_iam_groups" {
  source = "./modules/iam-users-groups"

  admin_group_name                  = "iam-admin-group"
  admin_group_policy_attachment_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  admin_users = [
    "jared-t480s",
    "jared-desktop"
  ]
}
