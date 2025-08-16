terraform {
  required_version = ">= 1.9.8" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.74.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket       = "devopstrains3"
    key          = "Auto.tfstate"
    region       = "ap-south-1"
    use_lockfile = true # instead of dynamodb_table
    encrypt      = true
  }
}

provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "ohio"
  region = "us-east-2"
}

##terraform force-unlock 79f392c7-0f31-5a1c-edf2-af3971c88955