resource "random_password" "vm-passwords" {
  count            = 3
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "vault_mount" "megastar" {
  path        = "megastar"
  type        = "kv-v2"
  description = "This Container Megastar Family Secrets"
}

resource "vault_mount" "superstar" {
  path        = "superstar"
  type        = "kv-v2"
  description = "This Container superstar Family Secrets"
}

#Creating Megastar Secrets
resource "vault_kv_secret_v2" "mega-secrets" {
  count               = 3
  mount               = vault_mount.megastar.path
  name                = "linux-machine-${count.index + 1}"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      username = "adminsree",
      password = element(random_password.vm-passwords.*.result, count.index)
    }
  )
  custom_metadata {
    max_versions = 5
    data = {
      foo = "vault@megastar.com"
    }
  }
}


#Creating Superstar Secrets
resource "vault_kv_secret_v2" "super-secrets" {
  count               = 3
  mount               = vault_mount.superstar.path
  name                = "super-linux-machine-${count.index + 1}"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      username = "adminsree",
      password = element(random_password.vm-passwords.*.result, count.index)
    }
  )
  custom_metadata {
    max_versions = 5
    data = {
      foo = "vault@superstar.com"
    }
  }
}