#!/bin/bash

set -e

echo "======================================="
echo "3-Tier Platform Deployment"
echo "======================================="

echo ""
echo "Checking prerequisites..."

command -v terraform >/dev/null 2>&1 || { echo "Terraform not installed"; exit 1; }
command -v aws >/dev/null 2>&1 || { echo "AWS CLI not installed"; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo "kubectl not installed"; exit 1; }
command -v helm >/dev/null 2>&1 || { echo "Helm not installed"; exit 1; }

echo ""
echo "AWS Identity"

aws sts get-caller-identity

echo ""
echo "======================================="
echo "Deploy Networking"
echo "======================================="

cd terraform/live/dev/networking

terraform init
terraform validate
terraform plan

echo ""
echo "Run the following command if plan looks good:"
echo "terraform apply"

echo ""
echo "======================================="
echo "Next Steps"
echo "======================================="

echo "1. Deploy Security Stack"
echo "2. Deploy Shared Services"
echo "3. Deploy Workload"
echo "4. Configure kubectl"
echo "5. Install Helm Charts"
echo "6. Install Monitoring"
echo "7. Deploy ArgoCD"

echo ""
echo "Deployment script completed."