environment        = "prod"
aws_region         = "us-east-1"
vpc_cidr           = "10.1.0.0/16"
vpc_name           = "ALPHAPROD1"
public_cidr_block  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_cidr_block = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
owner              = "JavaAppTeam"