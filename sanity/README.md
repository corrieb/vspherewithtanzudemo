# Sanity checks for a TKC cluster

This configuration and scripts represent a convenient way to test a new TKC cluster

The simplest way to use these scripts is to run them one after the other from the root.

Eg. sanity/scripts/1-configmap.sh

The checks comprise:

1. Create a ConfigMap - validates permission to create a simple object
2. Run a Pod - validates K8S admin permissions & validates registry settings
3. Run a Deployment - validates permissions of the default system user
4. Create a ClusterIP Service - validates cluster networking
5. Create an Load-Balanced Service - validates HAProxy load balancing
6. Create a Stateful App - validates persistent volumes are working
7. Run a DaemonSet - validates all nodes can be scheduled to
8. Deploy an ingress controller - validates a more complex setup
9. Create and test an ingress - validates the ingress controller

Note that you can also specify a namespace for tests 1-6 by appending it to the script

Eg. sanity/scripts/1-configmap.sh mynamespace

Each script has more information about the specific test and its prerequisites