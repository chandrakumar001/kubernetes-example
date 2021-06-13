#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

echo "#kubectl delete ns demos"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml delete ns demos

echo  
echo "############################################################"
echo "#Ex:1 create the dev namespace"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f demo-namespace.yaml -n demos

echo  
echo "############################################################"
echo "#Ex:2 There is no quota"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get quota -n demos

echo 
echo "############################################################"
echo "#Ex:3 Install quota"
echo "############################################################"
cat quota.yaml
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f quota.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe quota demo-quota -n demos

echo  
echo "############################################################"
echo "#Ex:4 Create a large pod - should fail"
echo "############################################################"
cat pod1.yaml   
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f pod1.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe rs quota-demo-large -n demos
#kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe pod quota-demo-large -n demos

printForQuotaAndPods

echo  
echo "############################################################"
echo "#Ex:5 Create a pod with no limits - should fail"
echo "############################################################"
cat pod2.yaml   
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f pod2.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe rs quota-demo-unspecified -n demos
#kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe pod quota-demo-unspecified -n demos

printForQuotaAndPods

echo  
echo "############################################################"
echo "#Ex:6 There are no default limits"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get limits -n demos

echo  
echo "############################################################"
echo "#Ex:7 Set default limits"
echo "############################################################"
cat limits.yaml   
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f limits.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe limits  demo-limits -n demos

echo  
echo "############################################################"
echo "#Ex:8 Create a pod with no limits - should succeed now"
echo "############################################################"
cat pod2.yaml   
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f pod2.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe rs quota-demo-unspecified -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe deployment quota-demo-unspecified -n demos
#kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe pod quota-demo-unspecified -n demos

printForQuotaAndPods

trap "echo" EXIT