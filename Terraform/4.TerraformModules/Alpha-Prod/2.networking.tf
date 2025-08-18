module "alpha_vpc_prod_1" {
  source             = "../modules/1.network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = "alpha_vpc_prod_1"
  environment        = var.environment
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  azs                = var.azs
  owner              = var.owner
}

module "alpha_vpc_prod_2" {
  source             = "../modules/1.network"
  vpc_cidr           = "172.20.0.0/16"
  vpc_name           = "SUPERSTAR"
  environment        = "DEV"
  public_cidr_block  = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  private_cidr_block = ["172.20.10.0/24", "172.20.20.0/24", "172.20.30.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  owner              = "MEGSTAR"
}


module "alpha_vpc_prod_3" {
  source             = "../modules/1.network"
  vpc_cidr           = "172.21.0.0/16"
  vpc_name           = "REBELSTAR"
  environment        = "DEV"
  public_cidr_block  = ["172.21.1.0/24", "172.21.2.0/24", "172.21.3.0/24"]
  private_cidr_block = ["172.21.10.0/24", "172.21.20.0/24", "172.21.30.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  owner              = "MEGSTAR"
}


