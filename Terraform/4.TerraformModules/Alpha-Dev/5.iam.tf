module "alpha_iam_1" {
  source              = "../modules/4.iam"
  env                 = lower(module.alpha_vpc_1.environment)
  rolename            = var.rolename
  instanceprofilename = var.instanceprofilename
  iam_policy_name     = var.iam_policy_name
}