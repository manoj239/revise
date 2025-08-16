
locals {
  ingress_ports = toset(var.ingress_ports)
  egress_ports  = toset(var.egress_ports)
  description   = upper("Allow all inbound traffic")
}
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = local.description
  vpc_id      = aws_vpc.default.id

  dynamic "ingress" {
    #for_each = var.ingress_ports
    for_each = local.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.egress_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

#ingress {
#  from_port   = 0
#  to_port     = 0
#  protocol    = "-1"
#  cidr_blocks = ["0.0.0.0/0"]
#}