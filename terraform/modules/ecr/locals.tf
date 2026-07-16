locals {

  name_prefix = "${var.project_name}-${var.environment}"

  repositories = {
    frontend = "frontend"
    backend  = "backend"
  }

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

}