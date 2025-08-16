resource "aws_instance" "public-server1" {
  ami                         = var.imagename[var.aws_region]
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet1.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true

  tags = {

    Name  = "Server-1"
    Env   = var.environment
    Owner = var.owner
  }
  user_data = <<-EOF
		#!/bin/bash
        sudo apt-get update
        sudo apt-get install -y nginx jq net-tools unzip
        echo "<h1>$(cat /etc/hostname)</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
    EOF

  lifecycle {
    ignore_changes  = [user_data, tags]
    #prevent_destroy = true

  }
}
#If you do need to destroy, you must remove prevent_destroy from code first.