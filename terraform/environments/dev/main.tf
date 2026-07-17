module "vpc" {

  source = "../../modules/vpc"

  vpc_name = "enterprise-dev-vpc"

  cidr_block = var.vpc_cidr

  public_subnet_cidr = var.public_subnet_cidr

  availability_zone = var.availability_zone

  environment = var.environment

}

module "security_group" {

  source = "../../modules/security-group"

  vpc_id = module.vpc.vpc_id

  security_group_name = "enterprise-dev-sg"

  environment = var.environment

}

