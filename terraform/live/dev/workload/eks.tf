# EKS Cluster

module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.37"

  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.networking.vpc_id
  subnet_ids = module.networking.private_subnet_ids

  enable_irsa = true

  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true

  create_cloudwatch_log_group = true

  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator"
  ]

  # Managed Node Group

  eks_managed_node_groups = {

    default = {

      instance_types = ["t3.medium"]

      capacity_type = "ON_DEMAND"

      min_size     = 2
      desired_size = 2
      max_size     = 4

      disk_size = 30

      ami_type = "AL2_x86_64"

      labels = {
        Environment = var.environment
      }

    }

  }

  # EKS Addons

  cluster_addons = {

    coredns = {}

    kube-proxy = {}

    vpc-cni = {}

    eks-pod-identity-agent = {}

  }

  tags = local.common_tags

}