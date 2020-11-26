#!/bin/bash

# Waits for a DaemonSet to be ready

if [ "$#" -ne 2 ]; then
    echo "Usage: ./wait-for-daemonset.sh <namespace> <name>"
    exit 1
fi

while [[ $(kubectl -n "$1" get daemonset "$2" -o 'jsonpath={..status.numberReady}') != $(kubectl -n "$1" get daemonset "$2" -o 'jsonpath={..status.desiredNumberScheduled}') ]]; do 
    echo "waiting for replicas to be ready" && sleep 1; 
done
