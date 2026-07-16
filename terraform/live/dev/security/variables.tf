variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "three-tier-platform"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}