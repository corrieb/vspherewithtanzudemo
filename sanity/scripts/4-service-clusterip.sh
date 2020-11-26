#!/bin/bash

# See https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/

# Note that this requires a PSP binding for the default service account
#   see rolebindings/rolebinding-def-svc-acc-psp.yaml

namespace=${1:-default}
sanity/scripts/3-deployment.sh "$namespace"
kubectl -n "$namespace" apply -f sanity/4-service-clusterip.yaml
kubectl -n "$namespace" get endpoints,services
echo -e "\nNow use util/curl-in-cluster.sh <cluster IP> to validate"
