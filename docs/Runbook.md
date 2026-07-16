# Operational Runbook

## Scale Deployment

kubectl scale deployment backend --replicas=5

---

## Restart Deployment

kubectl rollout restart deployment backend

---

## Check Pods

kubectl get pods

---

## Logs

kubectl logs POD_NAME

---

## Exec

kubectl exec -it POD_NAME -- sh

---

## Rollback

helm rollback backend 1