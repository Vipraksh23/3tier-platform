# GitOps Deployment Flow

Developer

↓

Push Code to GitHub

↓

GitHub Actions

↓

Build Docker Image

↓

Push Docker Image to Amazon ECR

↓

Update Helm values.yaml

↓

Commit Image Tag

↓

Push to Git Repository

↓

ArgoCD detects Git change

↓

Sync Kubernetes Cluster

↓

Rolling Update