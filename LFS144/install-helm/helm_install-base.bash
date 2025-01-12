#!/usr/bin/env bash

kubectl config use kind-kind-ica

helm uninstall istio-base -n istio-system

helm upgrade --install istio-base istio/base -n istio-system --create-namespace -f values-base.yaml

#helm upgrade --install istiod istio/istiod -n istio-system --wait
