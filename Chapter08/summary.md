# 08. 인그레스 (Ingress)


* Ingress: reverse proxy 규칙
* Ingress Controller: 규칙을 수행하는 실제 구현체
    * __nginx__
    * Traefik

On-premise 입장에서는 지금처럼 cloudflare 써서 일단 내 서버로 도착시키고, NodePort로 포트 고정시켜서 받으면 되는게 아닌가 싶기는 하다.
아님 cloudflare tunnel (?)이랑 뭐랑 해서 load balancer 연동해봐도 될 것도 같고.

구체적인 사용 방법은 직접 짜보면서 삽질해봐야 할 듯.
