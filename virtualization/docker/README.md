## Docker

### 자주 쓰이는 명령어

[Dockerfile 자주 쓰이는 명령어](https://www.daleseo.com/dockerfile/)

#### exited된 모든 컨테이너를 지우고 싶을 때

```bash
$ docker rm $(docker ps -a -q -f status=exited)
```

### 환경설정

-   [윈도우 WSL에서 Docker 설치하는 방법](https://www.lainyzine.com/ko/article/how-to-install-docker-on-wsl/#docker-%EC%84%A4%EC%B9%98%EB%A5%BC-%EC%9C%84%ED%95%9C-wsl-%EC%A4%80%EB%B9%84-%EC%9E%91%EC%97%85)
-   [Mac에서 Docker 환경구성 및 기본 사용법](https://bblog.tistory.com/297)
-   [Docker Desktop 대탈출, multipass로 갑니다](https://jybaek.tistory.com/934)
-   [Mac에서 Docker Desktop 사용하지 않고 Docker 사용하기](https://blog.bsk.im/2021/09/07/macos-docker-without-docker-feat-minikube-ko/)
-   [Slicon M1 Mac에서 Lima로 Docker Desktop 대체 하기](https://breezymind.com/slicon-m1-mac-lima-docker-desktop-alternative/)
-   [Slicon M1 Mac에서 쿠버네티스 환경 구축하기 (feat. lima+minikube)](https://breezymind.com/slicon-m1-mac-kubernetes-env-with-lima-minikube/)

#### lima 컨테이너 사용

기본적으로 아래와 같이 사용하면 `default`라는 이름의 dockder 컨테이너를 실행 가능
```bash
$ limactl start --name default template://docker
```

그런데 4GB 메모리로는 올라가지 않는 docker 컨테이너(예를 들어 Airflow)들이 있어, 아래와 같이 직접 수정
```bash
$ wget https://raw.githubusercontent.com/lima-vm/lima/master/examples/docker.yaml
$ mv docker.yaml default.yaml
```

default.yaml
```yaml
cpus: 4
memory: "8GiB"
disk: "100GiB"
```

변경된 정보로 컨테이너를 실행
```bash
$ limactl start default.yaml
$ limactl ls
NAME       STATUS     SSH                ARCH      CPUS    MEMORY    DISK      DIR
default    Running    127.0.0.1:60022    x86_64    4       8GiB      100GiB    /Users/user/.lima/default
```

### Trouble Shooting

- [exec: "docker-credential-desktop.exe": executable file not found in $PATH](https://stackoverflow.com/a/65896682)
