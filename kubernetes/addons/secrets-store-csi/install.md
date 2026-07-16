Install

```bash
helm repo add secrets-store-csi-driver \
https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts

helm repo update

helm install csi secrets-store-csi-driver/secrets-store-csi-driver \
-n kube-system \
-f values.yaml
```