output "rds_address" {
  value       = "${aws_db_instance.myrds1.address}"
}

output "rds_port" {
  value       = "${aws_db_instance.myrds1.port}"
}

output "rds_endpoint" {
  value       = "${aws_db_instance.myrds1.endpoint}"
}

output "rds_db_name" {
  value       = "${aws_db_instance.myrds1.db_name}"
}

