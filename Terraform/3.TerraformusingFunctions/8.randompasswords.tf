resource "aws_s3_bucket" "devopspracticestatefilenew1" {
  provider = aws.ohio
  bucket   = "skrmanojku"
  #
  tags = {
    Name        = "Skrmanojku"
    Environment = "var.environment"
  }
}

resource "random_password" "passwords" {
  count            = 3
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_secretsmanager_secret" "rds-secdreets" {
  provider = aws.ohio
  count    = 3
  name     = "rds-secdreets-${count.index}"
}

# Creating a AWS secret versions for database master account (Masteraccountdb)
resource "aws_secretsmanager_secret_version" "sversion" {
  provider      = aws.ohio
  count         = 3
  secret_id     = element(aws_secretsmanager_secret.rds-secdreets[*].id, count.index)
  secret_string = <<EOF
   {
   "username": "adminaccount",
   "password": "${element(random_password.passwords[*].result, count.index)}"
   }
EOF
}