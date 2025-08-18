#This module should be created live during the class so that students can see how to create a module from scratch.

module "alpha_efs_1" {
  source      = "../modules/12.efs"
  environment = module.alpha_vpc_1.environment
  efs_name    = var.efs_name
}