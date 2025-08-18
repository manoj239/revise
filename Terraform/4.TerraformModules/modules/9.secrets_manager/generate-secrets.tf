# Create a random generated password to use in secrets. 
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_!$^&*"
}

# Creating a AWS secret for database master account (Masteraccoundb)

resource "aws_secretsmanager_secret" "rds-secret" {
  name = var.rds_secret_name
}

# Creating a AWS secret versions for database master account (Masteraccoundb)
resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id     = aws_secretsmanager_secret.rds-secret.id
  secret_string = <<EOF
   {
    "username": "adminaccount",
    "password": "${random_password.password.result}"
   }
EOF
}

