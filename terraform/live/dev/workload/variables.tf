variable "aws_region" {

  description = "AWS Region"

  type = string

  default = "ap-south-1"

}

variable "project_name" {

  description = "Project Name"

  type = string

  default = "three-tier-platform"

}

variable "environment" {

  description = "Deployment Environment"

  type = string

  default = "dev"

}

variable "vpc_cidr" {

  type = string

  default = "10.0.0.0/16"

}

variable "availability_zones" {

  type = list(string)

  default = [

    "ap-south-1a",

    "ap-south-1b"

  ]

}

variable "public_subnet_cidrs" {

  type = list(string)

  default = [

    "10.0.1.0/24",

    "10.0.2.0/24"

  ]

}

variable "private_subnet_cidrs" {

  type = list(string)

  default = [

    "10.0.11.0/24",

    "10.0.12.0/24"

  ]

}

variable "cluster_version" {

  type = string

  default = "1.31"

}

variable "db_name" {

  type        = string
  description = "Database name"

  default = "appdb"

}

variable "db_username" {

  type        = string
  description = "Database admin username"

  default = "postgres"

}

variable "github_repository" {

  description = "GitHub repository"

  type = string

  default = "Vipraksh23/3tier-platform"

}