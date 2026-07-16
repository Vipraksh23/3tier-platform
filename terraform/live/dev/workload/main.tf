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

module "github_oidc" {

  source = "../../../modules/github_oidc"

  project_name = var.project_name

  environment = var.environment

  aws_region = var.aws_region

  github_repository = "Vipraksh23/3tier-platform"

}

module "ecr" {

  source = "../../../modules/ecr"

  project_name = var.project_name

  environment = var.environment

}

module "secretsmanager" {

  source = "../../../modules/secretsmanager"

  project_name = var.project_name

  environment = var.environment

  db_name = var.db_name

  db_username = var.db_username

}

module "rds" {

  source = "../../../modules/rds"

  project_name = var.project_name
  environment  = var.environment

  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids

  db_name     = var.db_name
  db_username = var.db_username
  db_password = module.secretsmanager.db_password

}

module "irsa" {

  source = "../../../modules/irsa"

  project_name = var.project_name

  environment = var.environment

  oidc_provider_arn = module.eks.oidc_provider_arn

  oidc_provider_url = module.eks.cluster_oidc_issuer_url

  namespace = "backend"

  service_account_name = "backend-sa"

  secret_arn = module.secretsmanager.secret_arn

}