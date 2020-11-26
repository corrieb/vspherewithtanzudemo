#!/bin/bash
kubectl vsphere login --server 192.168.20.128 -u bob@vsphere.local --tanzu-kubernetes-cluster-name simple-cluster --tanzu-kubernetes-cluster-namespace test-cluster
kubectl config use-context simple-cluster
