terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }

  backend "s3" {
    bucket       = "devopstrains3"
    key          = "Auto.tfstate"
    region       = "ap-south-1"
    use_lockfile = true # instead of dynamodb_table
    #encrypt      = true
  }

}

#provider "aws" {
#  alias  = "n_virginia"
#  region = "us-east-1"
#}

provider "aws" {
  region = var.aws_region
}