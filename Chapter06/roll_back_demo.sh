

kubectl apply -f ./deployment-nginx.yaml --record
kubectl get pods
kubectl get replicasets
kubectl rollout history deployment my-nginx-deployment


# Update application
kubectl set image deployment my-nginx-deployment nginx=nginx:1.11 --record

cat <<EOF

>  A new replicaSet with nginx:1.11 will be created, but still the old one exists too.

EOF
kubectl get pods
kubectl get replicasets
kubectl rollout history deployment my-nginx-deployment



cat <<'EOF'

> Now you can rollback using `kubectl rollout undo deployment my-nginx-deployment --to-revision=<n>`

EOF

echo '\n\n'

kubectl describe deploy my-nginx-deployment


kubectl delete -f ./deployment-nginx.yaml
