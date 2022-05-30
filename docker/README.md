## Docker

- [Dockerfile 자주 쓰이는 명령어](https://www.daleseo.com/dockerfile/)

### 자주 쓰이는 명령어

#### exited된 모든 컨테이너를 지우고 싶을 때

```bash
$ docker rm $(docker ps -a -q -f status=exited)
```

### 환경설정
- [WSL2에 도커 데스크턉 설정](https://blog.wslhub.com/%EC%9C%A0%EB%A3%8C%EB%A1%9C-%EC%A0%84%ED%99%98%EB%90%98%EB%8A%94-%EB%8F%84%EC%BB%A4-%EB%8D%B0%EC%8A%A4%ED%81%AC%ED%86%B1-%EB%8C%80%EC%95%88-%EC%B0%BE%EA%B8%B0-%EC%9C%88%EB%8F%84%EC%9A%B0-%EC%82%AC%EC%9A%A9%EC%9E%90-74f1a261eb32)
- [Mac에서 Docker 환경구성 및 기본 사용법](https://bblog.tistory.com/297)
- [Docker Desktop 대탈출, multipass로 갑니다](https://jybaek.tistory.com/934)
- [Mac에서 Docker Desktop 사용하지 않고 Docker 사용하기](https://blog.bsk.im/2021/09/07/macos-docker-without-docker-feat-minikube-ko/)
- [Slicon M1 Mac에서 Lima로 Docker Desktop 대체 하기](https://breezymind.com/slicon-m1-mac-lima-docker-desktop-alternative/)
