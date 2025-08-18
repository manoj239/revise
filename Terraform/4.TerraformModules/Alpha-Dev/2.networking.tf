module "alpha_vpc_1" {
  source             = "../modules/1.network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  environment        = var.environment
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  azs                = var.azs
  owner              = var.owner
}

module "alpha_vpc_2" {
  source             = "../modules/1.network"
  vpc_cidr           = "172.19.0.0/16"
  vpc_name           = "MEGASTAR"
  environment        = "DEV"
  public_cidr_block  = ["172.19.1.0/24", "172.19.2.0/24", "172.19.3.0/24"]
  private_cidr_block = ["172.19.10.0/24", "172.19.20.0/24", "172.19.30.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  owner              = "MEGSTAR"
}

