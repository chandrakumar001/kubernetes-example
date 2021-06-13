#!/bin/bash

echo  
echo "############################################################"
echo "#Ex:1 create the dev namespace"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f hpa/demo-namespace.yaml -n demos

echo 
echo "############################################################"
echo "#Ex:2 Install php-apache"
echo "############################################################"
cat php-apache.yaml
echo 
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f hpa/php-apache.yaml -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml describe get deployment -n demos

echo 
echo "############################################################"
echo "#Ex:3 Install php-apache HPA"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10 -n demos
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml get hpa -n demos

echo 
echo "############################################################"
echo "#Ex:4 Increase load"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

trap "echo" EXIT