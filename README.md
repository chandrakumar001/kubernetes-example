# kubernetes-example

reference:
    
    kubernetes-metrics-server:
    kubectl  apply -f hpa/components.yaml
    #### Load Testing

    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f load-test-calls.yaml -n demos
    STOP Load Testing
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml exec -it load-test-calls-587c88ccd9-q2lnx /bin/sh -n demos    
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml scale --replicas=0 deployment/load-test-calls -n demos
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml scale --replicas=0 deployment/load-test -n demos    

    https://github.com/vishh/contrib/blob/master/micro-demos/
    https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/

