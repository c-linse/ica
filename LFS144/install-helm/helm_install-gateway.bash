#!/usr/bin/env bash

kubectl config use kind-kind-ica

helm uninstall istio/gateway -n istio-system

helm upgrade --install istio-gateway istio/gateway -n istio-system --create-namespace -f values-gateway.yaml

