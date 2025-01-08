#!/usr/bin/env bash

kubectl config use kind-kind-ica

kubectl apply -f 7-dark-release-rules-staff-service.yaml
