output "cluster_name" {

  value = module.eks.cluster_name

}

output "cluster_endpoint" {

  value = module.eks.cluster_endpoint

}

output "cluster_oidc_provider_arn" {

  value = module.eks.oidc_provider_arn

}

output "rds_endpoint" {

  value = module.rds.db_endpoint

}

output "rds_port" {

  value = module.rds.db_port

}