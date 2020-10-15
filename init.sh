#!/bin/bash
kubectl create namespace ns1
kubectl apply -f roles
kubectl apply -f rolebindings
