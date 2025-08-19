module "alpha_elb_1" {
  source          = "../modules/7.elb-nlb"
  env             = module.alpha_vpc_1.environment
  nlbname         = var.nlbname
  subnets         = module.alpha_vpc_1.public_subnets_id
  nlbtgname       = var.nlbtgname
  vpc_id          = module.alpha_vpc_1.vpc_id
  private_servers = module.alpha_compute_1.private_servers
  #*.awsb62.xyz Certificate ARN
  certificate_arn = var.alb_certificate_arn
}




