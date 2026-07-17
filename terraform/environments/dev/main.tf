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

module "key_pair" {

  source = "../../modules/key-pair"

  key_name = "enterprise-dev-key"

  public_key_path = var.public_key_path

}

module "ec2" {

  source = "../../modules/ec2"

  instance_name = "enterprise-dev-server"

  ami_id = var.ami_id

  instance_type = var.instance_type

  subnet_id = module.vpc.public_subnet_id

  security_group_id = module.security_group.security_group_id

  key_name = module.key_pair.key_name

  environment = var.environment

}



