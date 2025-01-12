#!/usr/bin/env bash

kubectl config use kind-kind-ica

# MANUAL
# Istio has a command-line interface (CLI) named istioctl with the subcommand kube-inject. The subcommand processes the original deployment manifest to produce a modified manifest with the sidecar container specification added to the pod (or pod template) specification. The modified output can then be applied to a Kubernetes cluster with the kubectl apply -f command.
istioctl kube-inject deploy.yaml

diff deploy.yaml deploy-injected.yaml


# AUTOMATIC
# When istio-injection=enabled is on namespace the mutating admission webhook is in place to place into every deployment/pod the proxy sidecar

k label namespace default istio-injection=enabled