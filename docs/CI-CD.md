# CI/CD Pipeline

## Infrastructure Pipeline

Developer

↓

Git Push

↓

GitHub Actions

↓

Terraform fmt

↓

Terraform init

↓

Terraform validate

↓

Terraform plan

↓

Terraform apply (Production)

---

## Application Pipeline

Developer

↓

Git Push

↓

Build Docker Images

↓

Push Images to Amazon ECR

↓

Update Helm values.yaml

↓

Commit

↓

ArgoCD Sync