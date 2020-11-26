#!/bin/bash

# Waits for a Pod to be ready

if [ "$#" -ne 2 ]; then
    echo "Usage: ./wait-for-pod.sh <namespace> <name>"
    exit 1
fi

while [[ $(kubectl -n "$1" get pod "$2" -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do 
    echo "waiting for pod" && sleep 1; 
done
