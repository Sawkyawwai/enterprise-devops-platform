module "vpc" {

  source = "../../modules/vpc"

  vpc_name    = "enterprise-dev-vpc"
  cidr_block  = var.vpc_cidr
  environment = var.environment

}
