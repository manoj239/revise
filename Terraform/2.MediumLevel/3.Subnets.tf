resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.devopsvpc.id
  map_public_ip_on_launch = true # ensures EC2 in this subnet gets a public IP
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.az1

  tags = {
    name = "${var.vpc_name}-public_subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.devopsvpc.id
  map_public_ip_on_launch = true # ensures EC2 in this subnet gets a public IP
  cidr_block              = var.subnet2_cidr
  availability_zone       = var.az2

  tags = {
    name = "${var.vpc_name}-public_subnet2"
  }
}

#map_public_ip_on_launch = true
#Without this, EC2 instances won’t get a public IP even if IGW exists.
#Always enable for public subnets.