#!/bin/bash
kubectl vsphere login --server 192.168.20.128 -u k8s-cluster-admin@vsphere.local
kubectl config use-context test-cluster
