resource "random_password" "password_1" {
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

resource "random_password" "password_2" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password_1]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password_3" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password_2]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password_4" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password_3]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password_54" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password_4]
  lifecycle {
    create_before_destroy = true
  }
}