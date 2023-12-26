# 07. 쿠버네티스 리소스의 관리와 설정

## Configmap

.env 쓰는 것 처럼 변수화를 가능케 한다.
configmap을 생성하는 명령어는 `kubectl create configmap <configmap name> <configs...>`

예시: 
* `kubectl create configmap log-level-configmap --from-literal LOG_LEVEL=DEBUG`
* `kubectl create configmap start-k8s --from-literal k8s=kubernetes --from-literal container=docker`

생성된 configmap은 `kubectl get configmap` 혹은 `kubectl get configmap -o yaml`을 통해 확인할 수 있다.
