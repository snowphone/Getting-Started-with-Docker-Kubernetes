#!/usr/bin/env sh


# Since this is for testing, it assumes the k3s runs on a single node 
# (e.g. master node and worker nodes are on the same server).

curl -sfL https://get.k3s.io | sh -

mkdir -p $HOME/.kube
sudo /etc/rancher/k3s/k3s.yaml | tee $HOME/.kube/config

cat <<'EOF'
Paste the following line into .shrc file:

export KUBECONFIG=$HOME/.kube/config
EOF
