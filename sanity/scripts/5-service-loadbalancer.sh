#!/bin/bash

# See https://kubernetes.io/docs/concepts/services-networking/service/

# Note that this requires a PSP binding for the default service account
#   see rolebindings/rolebinding-def-svc-acc-psp.yaml

namespace=${1:-default}
sanity/scripts/3-deployment.sh "$namespace"
kubectl -n "$namespace" apply -f sanity/5-service-loadbalancer.yaml
util/wait-for-external-IP.sh "$namespace" my-loadbalanced-service
kubectl -n "$namespace" get endpoints,services
echo -e "\nNow use curl <external IP>:80 to validate"
