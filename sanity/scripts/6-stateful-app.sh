#!/bin/bash

# See https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-A19F6480-40DC-4343-A5A9-A5D3BFC0742E.html

# Note that this requires a PSP binding for the default service account
#   see rolebindings/rolebinding-def-svc-acc-psp.yaml

namespace=${1:-default}
name="mysql"

kubectl -n "$namespace" apply -f sanity/6-stateful-app.yaml
util/wait-for-deployment.sh "$namespace" "$name"
kubectl -n "$namespace" get pvc
kubectl -n "$namespace" get deployment "$name"