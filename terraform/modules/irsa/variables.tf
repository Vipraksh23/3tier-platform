variable "project_name" {

  type = string

}

variable "environment" {

  type = string

}

variable "oidc_provider_arn" {

  type = string

}

variable "oidc_provider_url" {

  type = string

}

variable "namespace" {

  type = string

  default = "default"

}

variable "service_account_name" {

  type = string

  default = "backend-sa"

}

variable "secret_arn" {

  type = string

}