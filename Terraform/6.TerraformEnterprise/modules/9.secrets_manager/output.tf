output "rds_secret" {
  value       = "${random_password.password.result}"
  sensitive   = true
  description = "description"
}

output "secret_name" {
  value       = var.rds_secret_name
  description = "Exporting Secret Name"
}
