## Kafka
- [Apache Kafka 기본 개념](https://jyeonth.tistory.com/30)

### Kafka 설치

`Mac` 기준으로 `brew` 이용하여 설치
```bash
$ brew install kafka
$ brew services start kafka
```

### SASL 컨슈머 설정

SASL_PLAINTEXT는 간단하게 username, password 기반으로 인증을 수행하는 방식이다. 컨슈머에서의 설정은 consumer.properties 파일이다. brew로 설치된 기준이며, 경로는 환경에 따라 다를 수 있다.
```properties
group.id=ted-consumer-group
security.protocol=SASL_PLAINTEXT
sasl.mechanism=PLAIN
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required \
             username="ted" \
             password="hwang";
```

위 설정한 consumer.properties 이용하여 읽고자 하는 토픽을 컨슈밍 시작한다.
```bash
$ /usr/local/opt/kafka/bin/kafka-console-consumer \
    --bootstrap-server kafka.ted-site.me:9092 \
    --consumer.config /usr/local/etc/kafka/consumer.properties \
    --topic TEST_TOPIC \
    --from-beginning
```
