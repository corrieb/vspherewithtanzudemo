#!/bin/bash

# Waits for an external IP of a service to be ready

if [ "$#" -ne 2 ]; then
    echo "Usage: ./wait-for-external-IP.sh <namespace> <service name>"
    exit 1
fi

filter='jsonpath={..status.loadBalancer.ingress[0].ip}'
while [[ $(kubectl -n "$1" get service "$2" -o "$filter") == "" ]]; do 
    echo "waiting for external IP" && sleep 1; 
done
