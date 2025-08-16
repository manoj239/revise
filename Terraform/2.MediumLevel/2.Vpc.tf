resource "aws_vpc" "devopsvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Owner       = var.owner
    environment = var.environment
  }
}

resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devopsvpc.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}