output "eks_cluster_role_arn" {
  description = "EKS Cluster IAM Role ARN"

  value = module.iam.eks_cluster_role_arn
}

output "eks_node_role_arn" {
  description = "EKS Node IAM Role ARN"

  value = module.iam.eks_node_role_arn
}