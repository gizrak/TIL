## Storage

### 스토리지

[오브젝트 스토리지, 파일 스토리지, 블록 스토리지의 차이](https://www.alibabacloud.com/ko/knowledge/difference-between-object-storage-file-storage-block-storage)

|종류|특징|
|---|---|
|파일 스토리지|파일시스템을 사용, 디렉토리 계층 구조, 메타 정보는 별도 관리 필요, NAS에 배치|
|오브젝트 스토리지|오브젝트 단위, 계층 구조 대신 평면 구조, 메타 정보 오브젝트 자체에 포함|
|블록 스토리지|파일 단위가 아니라 고정된 크기의 블록으로 분산 처리, 계층 구조 필요 없음|

### 파일시스템

[어떤 분산 파일 시스템을 사용해야 하는가?](https://d2.naver.com/helloworld/258077)

|종류|환경|특징|확장방식|
|---|---|---|---|
|NFS|Linux/Unix|유닉스 계열 전통, 로컬과 같은 사용성, NAS 구성|Scale-Up|
|CIFS|Windows|SMB(삼바)를 바탕으로 구축한 윈도우 기반, 로컬과 같은 사용성, NAS 구성|Scale-Up|
|OwFS|전체|분산/복제 저장, 작은 용량 다수의 파일 장점, Fuse 통한 마운트 가능|Scale-Out|
|HDFS|전체|대용량을 청크로 분해 분산/복제 저장, 대용량 적합, 다수 취약|Scale-Out|
|Ceph|전체|다른 분산 시스템과 비슷 + 메타서버 클러스터 형태로 동작|Scale-Out|
