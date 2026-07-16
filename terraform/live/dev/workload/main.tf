module "networking" {

  source = "../../../modules/vpc"

  aws_region = var.aws_region

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

}

module "iam" {

  source = "../../../modules/iam"

  project_name = var.project_name

  environment = var.environment

}

module "ecr" {

  source = "../../../modules/ecr"

  project_name = var.project_name

  environment = var.environment

}

module "rds" {

  source = "../../../modules/rds"

  project_name = var.project_name

  environment = var.environment

  vpc_id = module.networking.vpc_id

  private_subnet_ids = module.networking.private_subnet_ids

  db_password = "ChangeMe@123"

}