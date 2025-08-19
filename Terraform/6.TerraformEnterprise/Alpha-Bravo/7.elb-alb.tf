module "alpha_elb_alb_1" {
  source          = "../modules/6.elb-alb"
  albname         = var.albname
  sg_id           = module.alpha_sg_1.sg_id
  subnets         = module.alpha_vpc_1.public_subnets_id
  env             = module.alpha_vpc_1.environment
  albtgname       = var.albtgname
  vpc_id          = module.alpha_vpc_1.vpc_id
  private_servers = module.alpha_compute_1.private_servers
  #*.awsb62.xyz Certificate ARN
  alb_certificate_arn = var.alb_certificate_arn
}



