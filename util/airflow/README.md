## Airflow

### Get Started

`docker-compose` 사용하는게 가장 편하다.

1. 일단 [M1 Mac을 기준으로 Lima를 사전 설치](https://breezymind.com/slicon-m1-mac-lima-docker-desktop-alternative/)한다.
2. 그리고 Airflow 공식 사이트에 있는 대로 [docker compose를 이용하여 설치](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html)한다.

이후 한가지 문제가 발생하는데, 이는 Lima가 디렉토리 기본 read-only 정책이라 로컬의 dags 디렉토리가 마운트가 안된다.

우선 `AIRFLOW_HOME`, `AIRFLOW_UID`, `AIRFLOW__CORE__LOAD_EXAMPLES`, `volumes`를 세팅한다.

```yaml
# docker-compose.yaml
version: '3'
x-airflow-common:
  &airflow-common
  # In order to add custom dependencies or upgrade provider packages you can use your extended image.
  # Comment the image line, place your Dockerfile in the directory where you placed the docker-compose.yaml
  # and uncomment the "build" line below, Then run `docker-compose build` to build the images.
  image: ${AIRFLOW_IMAGE_NAME:-apache/airflow:2.4.3}
  # build: .
  environment:
    &airflow-common-env
    AIRFLOW_HOME: /home/airflow
    AIRFLOW_UID: 50000
    AIRFLOW__CORE__LOAD_EXAMPLES: 'false'
  volumes:
   - ./dags:/home/airflow/dags
   - ./logs:/home/airflow/logs
   - ./plugins:/home/airflow/plugins
```

`airflow` 계정의 기본 UID가 `50000` 이니까 `.env`에도 그렇게 세팅한다.

```bash
$ pwd
/Users/user/docker/airflow
$ cat .env
AIRFLOW_UID=50000
```

그리고 lima 설정에서 writable 디렉토리를 설정한다.

```bash
# ~/.lima/default/lima.yaml
mounts:
- location: "~/docker/airflow"
  writable: true
```

### 참고 자료

- Airflow Local Executor와 Celery Executor: [https://dydwnsekd.tistory.com/98](https://dydwnsekd.tistory.com/98)
