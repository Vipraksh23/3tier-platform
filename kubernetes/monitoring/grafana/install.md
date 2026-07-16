# Grafana Installation

## Add Helm Repository

```bash
helm repo add grafana https://grafana.github.io/helm-charts

helm repo update
```

## Install

```bash
helm upgrade --install grafana grafana/grafana \
-n monitoring \
--create-namespace \
-f values.yaml
```

## Verify

```bash
kubectl get pods -n monitoring
```

Expected

```
grafana-xxxxxxxx
```

## Get Admin Password

```bash
kubectl get secret grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d
```

## Port Forward

```bash
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

Open

```
http://localhost:3000
```