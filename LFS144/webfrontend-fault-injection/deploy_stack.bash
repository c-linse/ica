#!/usr/bin/env bash

kubectl config use kind-kind-ica
# install Prometheus, Grafana, Jaeger, and Kiali.
kubectl apply -f ../samples/addons/grafana.yaml
kubectl apply -f ../samples/addons/jaeger.yaml
kubectl apply -f ../samples/addons/kiali.yaml
kubectl apply -f ../samples/addons/prometheus.yaml

kubectl apply -f gw.yaml
kubectl apply -f web-frontend.yaml
kubectl apply -f customers.yaml
kubectl apply -f customers-delay.yaml
kubectl apply -f customers-fault.yaml
