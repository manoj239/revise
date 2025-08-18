module "alpha_s3" {
  source      = "../modules/11.s3"
  environment = lower(module.alpha_vpc_1.environment)
  bucket_name = var.bucket_name
}


