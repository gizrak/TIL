## kafkactl

> kafka 관리 CLI kafkactl

#### 설치

mac에서 설치
```bash
brew tap deviceinsight/packages
brew install deviceinsight/packages/kafkactl
brew upgrade deviceinsight/packages/kafkactl
```

리눅스에서 설치
```bash
wget https://github.com/deviceinsight/kafkactl/releases/download/v3.1.0/kafkactl_3.1.0_linux_amd64.tar.gz
```

#### 설정 방법

```bash
cat ~/.config/kafkactl/config.yml
contexts:
  default:
    brokers:
    - 10.111.111.111:9092
    - 10.112.112.112:9092
  svc-dev:
    brokers:
    - 10.211.211.211:9092
    - 10.212.212.212:9092
    - 10.213.213.213:9092
current-context: svc-dev
```

#### 사용법

이미 생성된 topic replication-factor 온라인 중에 변경하는 것도 한줄이면 됨
```bash
kafkactl alter topic mytopic --replication-factor 3
```
