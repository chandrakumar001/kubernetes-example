#!/bin/bash

function printForQuotaAndPods() {
    echo  
    echo "############################################################"
    echo "#Get quota and pods"
    echo "############################################################"
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get pods -n demos
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe quota -n demos
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe limits -n demos
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get hpa -n demos
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get rs -n demos

}
trap "echo" EXIT