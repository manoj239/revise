
resource "aws_instance" "public-servers" {
  count                       = var.environment == "dev" || var.environment == "DEV" ? 3 : 1
  ami                         = lookup(var.imagename, var.aws_region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets[*].id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name    = "${var.vpc_name}-public-server${count.index + 1}"
    Env     = var.environment
    Owner   = var.owner
    Version = var.appversion
  }
}