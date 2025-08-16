#resource "random_password" "passwords" {
#  count            = 5
#  length           = 16
#  min_lower        = 4
#  min_upper        = 4
#  min_numeric      = 4
#  min_special      = 4
#  special          = true
#  override_special = "!@$#"
#}

#Access passwords via random_password.password[0].result, random_password.password[1].result,
#etc. This reduces duplication and is easier to maintain.

resource "random_password" "password1" {
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

resource "random_password" "password2" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password1]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password3" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password2]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password4" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password3]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password5" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password4]
  lifecycle {
    create_before_destroy = true
  }
}