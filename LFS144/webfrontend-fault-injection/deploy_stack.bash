#!/usr/bin/env bash

kubectl config use kind-kind-ica
kubectl apply -f ing-gw.yaml
kubectl apply -f webfrontend.yaml
kubectl apply -f customers-v1.yaml
kubectl apply -f vs.yaml
kubectl apply -f customers-dr.yaml
kubectl apply -f customers-vs.yaml
kubectl apply -f customers-v2.yaml
kubectl apply -f customers-50-50.yaml