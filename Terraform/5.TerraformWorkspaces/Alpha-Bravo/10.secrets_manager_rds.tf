resource "random_integer" "random_user_id" {
  max = 999999
  min = 100000
}
module "alpha_secret_rds" {
  source          = "../modules/9.secrets_manager"
  rds_secret_name = "mysql-rds-password-${random_integer.random_user_id.result}"
}