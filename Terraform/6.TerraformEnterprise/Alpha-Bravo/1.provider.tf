provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.assume_rolename
  }
}

terraform {
  required_version = "<= 1.9.8"
  required_providers {
    aws = {
      version = "<= 6.0.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "devsecopsb43terraform"
    key    = "customer_workspace_b43.tfstate"
    region = "us-east-1"
  }
}
