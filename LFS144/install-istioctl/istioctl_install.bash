#!/usr/bin/env bash

kubectl config use kind-kind-ica

## install with default profile
# istioctl install

istioctl install --set profile=demo -y

# istioctl install -f values-base.yaml -y

# istioctl manifest generate -f values-base.yaml > gen2.yaml

# istioctl install -f istio-operator-base.yaml -y

# istioctl install -f istio-operator-gw.yaml -y