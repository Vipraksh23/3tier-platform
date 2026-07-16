variable "project_name" {
  description = "Project identifier used for naming resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"    # change as per requirement
}

variable "availability_zones" {
  description = "Availability Zones used for the VPC"
  type        = list(string)

  default = [
    "ap-south-1a",         #change as per requirement
    "ap-south-1b"
  ]
}

variable "public_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.1.0/24",         #change as per requirement
    "10.0.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.11.0/24",        #change as per requirement
    "10.0.12.0/24"
  ]
}