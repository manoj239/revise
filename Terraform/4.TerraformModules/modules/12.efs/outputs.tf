#This module should be created live during the class so that students can see how to create a module from scratch.

output "efs_id" {
  value = aws_efs_file_system.efs.id
}

output "efs_dns_name" {
  value = aws_efs_file_system.efs.dns_name
}