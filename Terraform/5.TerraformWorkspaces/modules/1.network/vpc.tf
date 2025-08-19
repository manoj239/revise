resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = lower(local.vpcname)
    Owner       = var.owner
    environment = var.environment
  }
}


resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = lower("${local.vpcname}-IGW")
  }
}