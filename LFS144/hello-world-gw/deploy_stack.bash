#!/usr/bin/env bash

kubectl config use kind-kind-ica
kubectl apply -f ing-gw.yaml
kubectl apply -f hello-world.yaml
kubectl apply -f vs.yaml