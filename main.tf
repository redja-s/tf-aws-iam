terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "state-bucket-292030"
    key    = "terraform-aws-iam.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

module "aws_iam_groups" {
  source = "./modules/groups"

  aws_iam_group_names = [
    "admins", "devs"
  ]
    
}