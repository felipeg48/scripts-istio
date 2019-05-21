#!/bin/bash

curl -L https://github.com/istio/istio/releases/download/1.1.1/istio-1.1.1-osx.tar.gz | tar xz

cd istio-1.1.1

kubectl create -f install/kubernetes/helm/istio-init/files/crd-11.yaml

kubectl create -f install/kubernetes/istio-demo.yaml

oc expose svc istio-ingressgateway
oc expose svc grafana
oc expose svc prometheus
oc expose svc tracing
oc expose service kiali --path=/kiali
oc adm policy add-cluster-role-to-user admin system:serviceaccount:istio-system:kiali-service-account -z default