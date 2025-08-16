resource "aws_route_table" "devops_routing1" {
  vpc_id = aws_vpc.devopsvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }
  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}

resource "aws_route_table_association" "public_routing_table" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.devops_routing1.id
}

resource "aws_route_table_association" "public_subnet2_assoc" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.devops_routing1.id
}

#One route table → many subnets
#You don’t need a separate route table per subnet (unless required for custom routes).
#Multiple subnets can share the same route table