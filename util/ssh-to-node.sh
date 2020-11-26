#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./ssh-to-node.sh <IP>"
    exit 1
fi

secret=$(kubectl get secret tkg-cluster-1-ssh-password -o jsonpath='{.data.ssh-passwordkey}' | base64 -D)
ssh -t root@192.168.20.6 sshpass -p "$secret" ssh vmware-system-user@$1 
