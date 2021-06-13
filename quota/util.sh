#!/bin/bash

function printForQuotaAndPods() {
    echo  
    echo "############################################################"
    echo "#Get quota and pods"
    echo "############################################################"
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get pods -n demos
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe quota -n demos
}
trap "echo" EXIT