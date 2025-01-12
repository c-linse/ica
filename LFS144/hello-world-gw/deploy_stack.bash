#!/usr/bin/env bash

kubectl config use kind-kind-ica
kubectl apply -f bookapp.yaml
kubectl apply -f curl.yaml

kubectl apply -f samples/addons/prometheus.yaml
kubectl apply -f samples/addons/grafana.yaml
kubectl apply -f samples/addons/jaeger.yaml
kubectl apply -f samples/addons/kiali.yaml

kubectl delete -f bookapp.yaml
kubectl delete -f curl.yaml