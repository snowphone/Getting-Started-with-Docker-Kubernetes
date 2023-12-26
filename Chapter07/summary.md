# 07. 쿠버네티스 리소스의 관리와 설정

## Configmap

.env 쓰는 것 처럼 변수화를 가능케 한다.
configmap을 생성하는 명령어는 `kubectl create configmap <configmap name> <configs...>`

예시: 
* `kubectl create configmap log-level-configmap --from-literal LOG_LEVEL=DEBUG`
* `kubectl create configmap start-k8s --from-literal k8s=kubernetes --from-literal container=docker`

생성된 configmap은 `kubectl get configmap` 혹은 `kubectl get configmap -o yaml`을 통해 확인할 수 있다.

* configmap은 1) 환경변수로 등록해서 사용하거나, 2) 파일의 형태로 마운트해서 사용할 수 있다.
    * 구체적인 예시는 ./all-env-from-configmap.yaml, ./volume-mount-configmap.yaml 확인하기


`--from-literal`이라는 옵션을 사용해도 되지만, 사실 dotenv를 직접 넘기는게 더 편할 수도 있다:

```env
k8s=kubernetes
container=docker
```
`kubectl create configmap from-envfile --from-env-file ./envfile.env`

volume mount기능을 이용하면 간단한 파일을 넘기는 것도 가능하다!


`kubectl create configmap index-file --from-file ./index.html` 이라고 작성할 시 key: `index.html`, value: `$(cat index.html)`이 된다.


## Secret

Secret도 configmap과 비슷한 역할을 함.
token이나 id/password, docker의 config.json 같은걸 저장하기 좋은 형태.
다만 실제로 어떠한 추가 보안 기능이 제공되는지는 의문

## kustomize

kustomize를 이용하면 configmap과 secret을 더 편하게 다룰 수 있다고 함...
