# locals {
#   db_creds = jsondecode(
#     data.aws_secretsmanager_secret_version.${var.secret_name}.secret_string
#   )
# }