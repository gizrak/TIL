## OpenSSL

### 따라해 보기

**1. Demo CA 설정**

- 현재 디렉토리에 demoCA 디렉토리 생성 : mkdir demoCA
- demoCA 디렉토리 안에 시리얼 파일 생성 : serial 이란 이름의 text 파일에 00 을 적는다.
- index 파일 생성 :  index.txt 란 이름으로 빈 파일을 만든다.

**2. CA 인증서 생성**

- CA 개인키 생성 :  openssl genrsa -des3 -out ca.key 1024
- Self-Signed CA 인증서 생성 :  openssl req -new -x509 -days 365 -key ca.key -out ca.crt 

**3. 하위 인증서 생성 (예: HTTPS Web 서버용..)**

- server 개인키 생성 : openssl genrsa -des3 -out server.key 1024 
- server 인증서 발급을 위한 요청파일 생성 : openssl req -new -days 365 -key server.key -out server.csr
- server 인증서 발급 : openssl ca -in server.csr -out server.crt -keyfile ca.key -cert ca.crt -outdir .

위 작업의 결과로 server.crt 라는 server용인증서가 생성되고 index 파일에 발급내역이, serial이 16진수로 1씩 증가한다.

**4. 인증서 인코딩 포멧 변경**

- openssl 이 생성하는 인증서의 인코딩은 발급 시 옵션을 주지 않으면 디폴트가 PEM (base64 encoding)이다.
- Java 등에서 사용하기 위한 DER 포맷(바이너리)으로 변경은 다음과 같이 수행한다.
    `openssl x509 -in ca.crt -out ca.der -outform DER`

**5. 인증서 내용 보기**

- openssl x509 -in ca.crt -text   (PEM 포맷인 경우)
- openssl x509 -in ca.der -inform DER -text (DER 포맷인 경우)

### TLS 통신

**인증에 사용될 파일 6개**
|type|private key|public_key|
|---|---|---|
|인증기관|ca_key.pem|ca.crt|
|서버|server_key.pem|server.crt|
|클라이언트|client_key.pem|client.crt|

**CA 개인키 생성**
```bash
openssl genrsa -des3 -out ca.key 1024
```

**CA csr 키 생성**
```bash
openssl req -new -key ca.key -out ca.csr
```

**Root CA 인증서 생성** 
```bash
openssl x509 -req -days 1280 -in ca.csr -signkey ca.key -out ca.crt
```

**개인키에서 패스워드 삭제하기** 
```bash
openssl rsa -in ca.key -out ca_key.pem
```

**Server 개인키 생성**
```bash
openssl genrsa -des3 -out server.key 1024
```

**Server csr 키 생성**
```bash
openssl req -new -key server.key -out server.csr
```

**Server 인증서 생성**
```bash
openssl x509 -req -in server.csr -out server.crt -signkey server.key -CA ca.crt -CAkey
ca.key -CAcreateserial -days 365
```

**개인키에서 패스워드 삭제하기** 
```bash
openssl rsa -in server.key -out server_key.pem
```

**Client 개인키 생성**
```bash
openssl genrsa -des3 -out client.key 1024
```

**Client csr 키 생성**
```bash
openssl req -new -key client.key -out client.csr
```

**Client 인증서 생성**
```bash
openssl x509 -req -in client.csr -out client.crt -signkey client.key -CA server.crt -CAkey
server.key -CAcreateserial -days 365
```

**개인키에서 패스워드 삭제하기** 
```bash
openssl rsa -in server.key -out server_key.pem
```

**crt->der 포맷변경**
```bash
openssl x509 -in ca.crt -out ca.der -outform DER
```

**pem->der 포맷변경**
```bash
openssl x509 -in demoCA/cacert.pem -outform DER -out cacert.der
```

**der->pem 포맷변경**
```bash
x509 -in cert.cer -inform DER -out cert.pem -outform PEM
```

**인증서 확인**
```bash
openssl x509 -noout -text -in client.crt
```

**비밀키 보기**
```bash
openssl rsa -noout -text -in server.key
```

**openssl 설치완료 확인**
```bash
httpd -t
```

**pfx 변환**
```bash
openssl pkcs12 -export -in client.crt -inkey client.key -certfile ca.crt -out bundle.p12
```

**pfx에서 키 추출**
```bash
OpenSSL> pkcs12 -in filename.pfx -nocerts -out key.pem
```

**pfx에서 인증서 추출**
```bash
OpenSSL> pkcs12 -in filename.pfx -clcerts -nokeys -out cert.pem
```

**라디우스 실행**
```bash
/usr/local/sbin/radiuse -x
```
