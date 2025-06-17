#!/bin/bash
set -e

oc get secret router-certs-default -n openshift-ingress -o jsonpath='{.data.tls\.crt}' | base64 -d >openshift-wildcard.crt\n
sudo mv openshift-wildcard.crt /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust extract
