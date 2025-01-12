#!/usr/bin/env bash

kubectl config use kind-kind-ica

helm uninstall istiod -n istio-system

helm upgrade --install istio-istiod istio/istiod -n istio-system --create-namespace -f values-istiod.yaml

#helm upgrade --install istiod istio/istiod -n istio-system --wait
