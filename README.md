# kubernetes-example


Kubernetes Objects are <b>persistent entities in the cluster</b>. These objects are used to represent the state of the cluster.

The following are some of the Kubernetes Objects:
    
    pods
    Namespaces
    ReplicationController (Manages Pods)
    DeploymentController (Manages Pods)
    StatefulSets
    DaemonSets
    Services
    ConfigMaps
    Volumes

### Pod
    
    A thin wrapper around one or more containers
### Deployment

    Details how to roll out (or roll back) across versions of your application

## Reference:  

    kubernetes-metrics-server:
    kubectl  apply -f hpa/components.yaml
    #### Load Testing

    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml apply -f load-test-calls.yaml -n demos
    STOP Load Testing
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml exec -it load-test-calls-587c88ccd9-q2lnx /bin/sh -n demos    
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml scale --replicas=0 deployment/load-test-calls -n demos
    kubectl --kubeconfig=chandran-edu-kubeconfig.yaml scale --replicas=0 deployment/load-test -n demos    

    https://engineering.opsgenie.com/advanced-kubernetes-objects-53f5e9bc0c28

    https://github.com/vishh/contrib/blob/master/micro-demos/
    https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/

