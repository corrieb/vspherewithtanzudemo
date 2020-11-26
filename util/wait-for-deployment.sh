#!/bin/bash

# Waits for a Deployment to be ready

if [ "$#" -ne 2 ]; then
    echo "Usage: ./wait-for-deployment.sh <namespace> <name>"
    exit 1
fi

while [[ $(kubectl -n "$1" get deployment "$2" -o 'jsonpath={..spec.replicas}') != $(kubectl -n "$1" get deployment "$2" -o 'jsonpath={..status.readyReplicas}') ]]; do 
    echo "waiting for replicas to be ready" && sleep 1; 
done
