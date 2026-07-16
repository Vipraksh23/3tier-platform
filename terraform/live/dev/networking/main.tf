module "vpc" {

  source = "../../../modules/vpc"

  aws_region = var.aws_region

  environment = var.environment

  project_name = var.project_name

}