# 🚀 Production-Ready 3-Tier Platform on AWS using Terraform, EKS, Helm & GitOps

A production-inspired cloud-native 3-tier application deployed on **Amazon EKS** using **Terraform**, **Helm**, **GitHub Actions**, and **ArgoCD** following Infrastructure as Code (IaC) and GitOps best practices.

---

# 📌 Project Overview

This project demonstrates how to build, provision, deploy, and manage a secure, scalable, production-style Kubernetes platform on AWS.

The infrastructure is fully automated using Terraform, applications are packaged using Helm, CI/CD is handled through GitHub Actions, and continuous deployment is managed using ArgoCD.

---

# 🏗️ Architecture

```
                        Developer
                            │
                            ▼
                     GitHub Repository
                            │
              Git Push / Pull Request
                            │
                            ▼
                   GitHub Actions CI
                            │
          Terraform Validate & Docker Build
                            │
             Push Images to Amazon ECR
                            │
                            ▼
                    GitOps Repository
                            │
                            ▼
                        ArgoCD
                            │
                     Sync Kubernetes
                            │
             ┌──────────────┴──────────────┐
             ▼                             ▼
         Frontend                     Backend
             │                             │
             └──────────────┬──────────────┘
                            ▼
                          Amazon RDS
                            │
                            ▼
                  AWS Secrets Manager
                            │
                            ▼
                          IRSA + CSI
```

---

# 🛠️ Tech Stack

## Cloud

- AWS

## Infrastructure as Code

- Terraform

## Container

- Docker

## Container Registry

- Amazon ECR

## Orchestration

- Amazon EKS

## Package Manager

- Helm

## CI/CD

- GitHub Actions

## GitOps

- ArgoCD

## Database

- Amazon RDS PostgreSQL

## Secrets

- AWS Secrets Manager
- Secrets Store CSI Driver

## IAM

- IAM Roles
- GitHub OIDC
- IRSA

## Monitoring (Upcoming)

- Prometheus
- Grafana

---

# 📂 Repository Structure

```
terraform/
│
├── live/
│   └── dev/
│       ├── networking/
│       ├── security/
│       ├── shared/
│       └── workload/
│
└── modules/
    ├── vpc/
    ├── iam/
    ├── ecr/
    ├── rds/
    ├── github_oidc/
    ├── irsa/
    └── secretsmanager/

kubernetes/
└── Helm/
    ├── frontend/
    └── backend/
```

---

# 🚀 Features

- Modular Terraform Architecture
- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Amazon EKS Cluster
- Managed Node Groups
- Amazon ECR
- Amazon RDS PostgreSQL
- IAM Roles
- GitHub OIDC Authentication
- IAM Roles for Service Accounts (IRSA)
- AWS Secrets Manager
- Secrets Store CSI Driver
- Helm Charts
- Horizontal Pod Autoscaler
- Pod Disruption Budget
- Rolling Updates
- Readiness & Liveness Probes
- AWS ALB Ingress
- GitOps Deployment

---

# 🔐 Security Features

- Private EKS API Endpoint
- IAM Least Privilege
- GitHub OIDC Authentication
- IRSA
- AWS Secrets Manager
- CSI Driver
- Kubernetes Service Accounts
- Read Only Root Filesystem
- Non Root Containers

---

# 🚀 Deployment Workflow

```
Developer

↓

Git Push

↓

GitHub Actions

↓

Terraform Validate

↓

Docker Build

↓

Amazon ECR

↓

Update Helm Chart

↓

ArgoCD Sync

↓

Amazon EKS

↓

Application Available
```

---

# ⚙️ Terraform Modules

| Module | Purpose |
|---------|----------|
| VPC | Networking |
| IAM | IAM Roles |
| ECR | Container Registry |
| RDS | PostgreSQL Database |
| GitHub OIDC | GitHub Authentication |
| IRSA | Kubernetes IAM Access |
| Secrets Manager | Database Secrets |

---

# ☸ Kubernetes Components

- Deployment
- Service
- Ingress
- Horizontal Pod Autoscaler
- Pod Disruption Budget
- Service Account
- SecretProviderClass

---

# 📈 CI/CD

GitHub Actions performs:

- Terraform Validation
- Docker Build
- Docker Push to Amazon ECR
- Helm Chart Update
- ArgoCD Deployment

---

# 📊 Monitoring (Planned)

- Prometheus
- Grafana
- Alertmanager

---

# 📜 Future Enhancements

- Multi-Environment Deployment
- Blue/Green Deployment
- Canary Deployment
- Velero Backup
- Fluent Bit Logging
- Loki
- ExternalDNS
- Cert Manager
- Kyverno Policies

---

# 📸 Screenshots

- AWS Infrastructure
- Terraform Apply
- Amazon EKS
- Amazon ECR
- GitHub Actions
- ArgoCD
- Grafana Dashboard

---

# 👨‍💻 Author

**Vipraksh Srivastava**

AWS | Terraform | Kubernetes | DevOps | GitHub Actions | ArgoCD

---