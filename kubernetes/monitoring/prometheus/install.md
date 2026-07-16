# Install kube-prometheus-stack

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
-n monitoring \
--create-namespace \
-f values.yaml
```

Verify

```bash
kubectl get pods -n monitoring
```