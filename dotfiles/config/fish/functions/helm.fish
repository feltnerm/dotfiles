function kubectl
    docker run --rm --user (id -u) -v ~/.kube:/config/.kube quay.io/widen/k8s:1.0.0 helm $argv
end
