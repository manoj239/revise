resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}

resource "aws_route_table" "terraform-private" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-private-route-table"
    Version = var.appversion
  }
}

resource "aws_route_table_association" "public-subnets" {
  #count          = 4
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public-subnets[*].id, count.index)
  route_table_id = aws_route_table.terraform-public.id
}

resource "aws_route_table_association" "private-subnets" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-private.id
}