# 06. 쿠버네티스 시작하기

* Pod 내부의 컨테이너는 같은 리눅스 컨테이너 (_e.g._ 네트워크)를 공유한다.
* 하나의 pod는 그 자체로 완전한 애플리케이션이다.
* ReplicaSet을 이용해서 pod (= 애플리케이션)을 여러개 유지함.
    * `spec.selector.matchLabels.app`에 정의된 이름과 같은 `spec.template.labels.app`을 찾아 `spec.replicas` 만큼 띄운다.
* Deployment는 가장 자주 쓰이는 형태의 object.
    * ReplicaSet의 higher-level abstraction이므로 보통 Deployment 하나만 작성하면 replicaSet까지 알아서 실행시 생성됨
    * 왜 replicaSet 놔두고 deployment를 다시 정의해서 쓰는가?
        * 배포 전략을 정의
        * 이전 버전으로의 롤백
        * 배포 버저닝
* Service object를 이용해서 다른 namespace (bridge)사이의 통신을 한다.
    * docker/docker-compose의 port binding의 역할을 하는 듯.
    * DNS
    * LB
    * Port exposure




kubectl get pods -o wide 했을 때 나오는 ip는 cluster (a group of nodes) 레벨에서 unique하고 사용 가능하다.
containerPort를 expose하지 않아도 최소한 같은 cluster 내부에서는 잘 동작하는 듯 싶다.
service는 일종의 gateway, LB 같은 역할을 하는데, 이걸 ip로 접근하는거는 cluster host도 가능한데, service의 `metadata.name` (=domain)으로 접근하려면 cluster 내부로 들어가야 할 것 같다.

ClusterIP 모드:
cluster 내부에서 쓸 수 있는 하나의 entry point를 만들어 준다는 것에 의의
내부에서 LB를 사용하고 싶다면 요정도만 해도 충분.

NodePort 모드:
각각의 node에 대해서 특정 포트를 열어놓는다.
외부에서 curl <node_ip>:<부여받은 30000번대 port> 하면 접근이 가능하다..?
근데 LB 안붙일거면 왜 굳이 직접 찔러서 쓰지..?
