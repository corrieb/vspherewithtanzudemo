#!/bin/bash
# See https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-5DFC347C-694B-4288-96DA-EAEB5818D951.html

namespace=${1:-default}
name="kuard"

kubectl -n "$namespace" run --restart=Never --image=gcr.io/kuar-demo/kuard-amd64:blue "$name"
util/wait-for-pod.sh "$namespace" "$name"
echo "Pod Started - now open http://localhost:8080 in your browser"
kubectl -n "$namespace" port-forward "$name" 8080:8080
