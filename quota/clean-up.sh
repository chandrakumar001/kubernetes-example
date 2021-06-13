#!/bin/bash

echo "#kubectl delete ns demos"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml delete ns demos

trap "echo" EXIT