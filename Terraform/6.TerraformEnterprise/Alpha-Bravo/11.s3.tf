locals {
  bucket_name = join("-", [var.bucket_name, random_integer.priority.result])
}


resource "random_integer" "priority" {
  min = 10000
  max = 50000
}

module "alpha_s3" {
  source      = "../modules/11.s3"
  environment = lower(module.alpha_vpc_1.environment)
  bucket_name = local.bucket_name
}


