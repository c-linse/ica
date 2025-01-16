#!/usr/bin/env bash

kubectl config use kind-kind-ica
kubectl apply -f ing-gw.yaml
kubectl apply -f webfrontend.yaml
kubectl apply -f vs.yaml
kubectl apply -f customers.yaml
kubectl apply -f customers-vs.yaml

