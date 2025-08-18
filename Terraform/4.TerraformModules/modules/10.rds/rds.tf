resource "aws_db_subnet_group" "default" {
  name       = var.db_subnet_group_name
  subnet_ids = var.private_subnets

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "myrds1" {
  allocated_storage    = var.allocated_storage #10
  engine               = var.engine #"mysql"
  engine_version       = var.engine_version #"8.0.28"
  identifier = var.identifier #"myrds1"
  instance_class       = var.instance_class #"db.t2.medium"
  db_name              = var.db_name #"devopsb27instance"
  db_subnet_group_name = aws_db_subnet_group.default.name
  # Manually Created secrets from AWS Secrets Manager
  username = var.username
  password = var.password
  #final_snapshot_identifier = true
  skip_final_snapshot = true
  publicly_accessible = true
  vpc_security_group_ids = [var.vpc_security_group_ids]
}

