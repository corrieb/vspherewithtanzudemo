#!/bin/bash

# This script will deploy Prometheus to a TKG cluster.
# Example taken from https://medium.com/kubernetes-tutorials/monitoring-your-kubernetes-deployments-with-prometheus-5665eda54045

kubectl apply -f prometheus/rbac.yaml
kubectl create configmap prometheus-config --from-file prometheus/config/prometheus.yml
kubectl apply -f prometheus/prometheus-deployment.yaml
util/wait-for-deployment.sh "default" "prometheus-deployment"
kubectl apply -f prometheus/prometheus-service.yaml
util/wait-for-external-IP.sh "default" "prometheus-service"
kubectl get services
echo -e "\nNow visit <external IP>:9090 in a browser"
