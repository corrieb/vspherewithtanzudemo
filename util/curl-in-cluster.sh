#!/bin/bash

# Runs a pod in the cluster and runs curl, passing through whatever parameters are given

if [ "$#" -ne 1 ]; then
    echo "Usage: ./curl-in-cluster.sh <curl args>"
    exit 1
fi

kubectl run -i --tty curl --image=docker.io/curlimages/curl:latest --restart=Never -- curl "$1"
kubectl delete pod curl
