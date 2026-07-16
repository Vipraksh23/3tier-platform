variable "aws_region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "ap-south-1" #change based on requirement
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used for resource tagging"
  type        = string
  default     = "three-tier-platform"
}