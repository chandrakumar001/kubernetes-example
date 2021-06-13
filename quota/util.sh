#!/bin/bash

function printForQuotaAndPods() {
    echo  
    echo "############################################################"
    echo "#Get quota and pods"
    echo "############################################################"
    echo "#1.Get quota"    
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe quota -n demos    
    echo "#2.Get limits" 
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe limits -n demos
    echo "#3.Get pods"   
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get pods -n demos
    echo "#4.Get hpa"    
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get hpa -n demos
    echo "#5.Get rs"    
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get rs -n demos
}
trap "echo" EXIT