#!/usr/bin/env bash

clustername="ica"

echo "deleting kind cluster kind-$clustername"
kind delete cluster --name="kind-$clustername"

echo "starting kind cluster kind-$clustername"
kind create cluster --name="kind-$clustername"

kubectl config use kind-kind-ica

kubectl label namespace default istio-injection=enabled

kubectl apply -f 1-istio-init.yaml
kubectl apply -f 2-istio-minikube.yaml
kubectl apply -f 3-kiali-secret.yaml

kubectl wait --for=condition=ready pod -n istio-system --all --timeout=300s

kubectl apply -f 4-application-full-stack.yaml
