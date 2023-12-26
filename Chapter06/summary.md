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

