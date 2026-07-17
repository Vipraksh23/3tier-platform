Write-Host ""
Write-Host "======================================="
Write-Host "3-Tier Platform Deployment"
Write-Host "======================================="
Write-Host ""

Write-Host "Checking prerequisites..."

terraform version
aws --version
kubectl version --client
helm version

Write-Host ""
Write-Host "AWS Identity"

aws sts get-caller-identity

Write-Host ""
Write-Host "======================================="
Write-Host "Deploy Networking"
Write-Host "======================================="

Set-Location terraform/live/dev/networking

terraform init
terraform validate
terraform plan

Write-Host ""
Write-Host "Run the following command if plan looks good:"
Write-Host "terraform apply"

Write-Host ""
Write-Host "======================================="
Write-Host "Next Steps"
Write-Host "======================================="

Write-Host "1. Deploy Security"
Write-Host "2. Deploy Shared Services"
Write-Host "3. Deploy Workload"
Write-Host "4. Configure kubectl"
Write-Host "5. Install Helm Charts"
Write-Host "6. Install Monitoring"
Write-Host "7. Deploy ArgoCD"

Write-Host ""
Write-Host "Deployment script completed."