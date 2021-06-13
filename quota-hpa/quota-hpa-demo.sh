#!/bin/bash

echo "#kubectl delete ns demos"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml delete ns demos

echo  
echo "############################################################"
echo "#create the dev namespace"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f demo-namespace.yaml -n demos

echo  
echo "############################################################"
echo "#There is no quota"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get quota -n demos

echo 
echo "############################################################"
echo "#Install quota"
echo "############################################################"
cat quota.yaml
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f quota.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe quota demo-quota -n demos

echo  
echo "############################################################"
echo "#Set default limits"
echo "############################################################"
cat limits.yaml   
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f limits.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe limits  demo-limits -n demos

echo 
echo "############################################################"
echo "#Install php-apache"
echo "############################################################"
cat php-apache.yaml
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f php-apache.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe get deployment -n demos

echo 
echo "############################################################"
echo "#Install php-apache HPA"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10 -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get hpa -n demos

echo 
echo "############################################################"
echo "#Increase load"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f load-test.yaml -n demos

trap "echo" EXIT