#!/bin/bash

# Waits for an external IP of an ingress to be ready

if [ "$#" -ne 2 ]; then
    echo "Usage: ./wait-for-ingress-IP.sh <namespace> <service name>"
    exit 1
fi

filter='jsonpath={..status.loadBalancer.ingress[0].ip}'
while [[ $(kubectl -n "$1" get ingress "$2" -o "$filter") == "" ]]; do 
    echo "waiting for ingress IP" && sleep 1; 
done
