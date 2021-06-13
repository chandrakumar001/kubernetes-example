#!/bin/bash

echo  
echo "############################################################"
echo "#create the dev namespace"
echo "############################################################"
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f demo-namespace.yaml -n demos

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
kubectl --kubeconfig=chandran-edu-kubeconfig.yaml run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"



# kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10
# kubectl get hpa



# . $(dirname ${BASH_SOURCE})/../util.sh

# desc "Run some pods under a replication controller"
# run "kubectl --namespace=demos run yes-autoscaler-demo \\
#     --image=busybox \\
#     --replicas=1 \\
#     --limits=cpu=100m \\
#     -o name \\
#     -- sh -c 'sleep 5; yes > /dev/null'"
# WHAT_WAS_RUN="$DEMO_RUN_STDOUT"

# desc "Look what I made!"
# run "kubectl --namespace=demos describe $WHAT_WAS_RUN"

# desc "One pod was created"
# run "kubectl --namespace=demos get pods -l run=yes-autoscaler-demo"

# desc "Create a pod autoscaler"
# run "kubectl --namespace=demos autoscale $WHAT_WAS_RUN --min=1 --max=10 --cpu-percent=25"

# desc "Watch pods get created"
# while true; do
#     run "kubectl --namespace=demos describe hpa yes-autoscaler-demo"
#     run "kubectl --namespace=demos get pods -l run=yes-autoscaler-demo"
# done

trap "echo" EXIT