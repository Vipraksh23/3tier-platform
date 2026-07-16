# AWS Load Balancer Controller

Add Helm repository

```bash
helm repo add eks https://aws.github.io/eks-charts

helm repo update
```

Install

```bash
helm upgrade --install aws-load-balancer-controller \
eks/aws-load-balancer-controller \
-n kube-system \
-f values.yaml
```

Verify

```bash
kubectl get pods -n kube-system
```

Expected

```
aws-load-balancer-controller
```