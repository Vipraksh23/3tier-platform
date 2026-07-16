# 3-Tier Platform Architecture

## Overview

This project provisions and deploys a production-ready 3-tier application on Amazon EKS using Terraform, GitHub Actions, Helm and ArgoCD.

---

## Architecture

                    GitHub
                       │
          ┌────────────┴────────────┐
          │                         │
          ▼                         ▼
 Terraform CI                Docker CI
          │                         │
          ▼                         ▼
      AWS Resources          Amazon ECR
          │                         │
          └────────────┬────────────┘
                       ▼
                    ArgoCD
                       │
                       ▼
                    Amazon EKS
             ┌─────────┴─────────┐
             ▼                   ▼
      Frontend Pod          Backend Pod
                                   │
                                   ▼
                              Amazon RDS

Monitoring

Prometheus
      │
      ▼
Grafana

---

## Components

- Terraform
- Amazon EKS
- Amazon ECR
- Amazon RDS
- GitHub Actions
- Helm
- ArgoCD
- Prometheus
- Grafana