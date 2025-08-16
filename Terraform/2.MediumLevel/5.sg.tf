resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow all inbound and outbound traffic"
  vpc_id      = aws_vpc.devopsvpc.id

  ingress {
    description = "All traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 means "all protocols"
    cidr_blocks = ["0.0.0.0/0"] # from anywhere (IPv4),open to the entire internet.
  }

  #ingress {
  #  description = "Allow HTTP"
  #  from_port   = 80
  #  to_port     = 80
  #  protocol    = "tcp"
  #  cidr_blocks = ["0.0.0.0/0"]
  #}

  #ingress {
  #  description = "Allow SSH from Office IP"
  #  from_port   = 22
  #  to_port     = 22
  #  protocol    = "tcp"
  #  cidr_blocks = ["YOUR_OFFICE_IP/32"]
  #}

  egress {
    description = "All traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  lifecycle {
    ignore_changes = [ingress]
  }

  tags = {
    Name = "allow_all"
  }
}
