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