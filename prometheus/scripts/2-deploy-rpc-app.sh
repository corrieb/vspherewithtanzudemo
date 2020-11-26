#!/bin/bash

# This script will deploy a Prometheus test app to a TKG cluster.
# It has a dependency on the deploy-prometheus.sh script being successfully run
# Example taken from https://medium.com/kubernetes-tutorials/monitoring-your-kubernetes-deployments-with-prometheus-5665eda54045

# Note that this requires a PSP binding for the default service account
#   see rolebindings/rolebinding-def-svc-acc-psp.yaml

kubectl apply -f prometheus/rpc-app-deployment.yaml
util/wait-for-deployment.sh "default" "rpc-app-deployment"
kubectl apply -f prometheus/rpc-app-service.yaml
util/wait-for-external-IP.sh "default" "rpc-app-service"
kubectl get services
echo -e "\nNow use curl http://<external IP>:8081/metrics to validate"
echo -e "\nYou can also visit the /targets endpoint in the Prometheus URL and see the app"
