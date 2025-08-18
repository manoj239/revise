#This module should be created live during the class so that students can see how to create a module from scratch.

resource "aws_efs_file_system" "efs" {
  creation_token = "efs-token"

  tags = {
    Name = var.efs_name
    environment = var.environment
  }
}