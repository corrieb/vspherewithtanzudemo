kubectl run -i --tty busybox --image=docker.io/library/busybox:latest --restart=Never -- sh
kubectl delete pod busybox
