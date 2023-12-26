# 06. 쿠버네티스 시작하기

* Pod 내부의 컨테이너는 같은 리눅스 컨테이너 (_e.g._ 네트워크)를 공유한다.
* 하나의 pod는 그 자체로 완전한 애플리케이션이다.
* ReplicaSet을 이용해서 pod (= 애플리케이션)을 여러개 유지함.
    * `spec.selector.matchLabels.app`에 정의된 이름과 같은 `spec.template.labels.app`을 찾아 `spec.replicas` 만큼 띄운다.
