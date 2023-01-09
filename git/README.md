### Get Started

[.gitconfig](.gitconfig) 파일을 생성
```bash
$ cd ~
$ vi .gitconfig
```

### Tips
- 브랜치 이름 변경
  ```bash
  git branch -m 변경전 변경후
  ```
- 패스워드 초기화
  ```bash
  git -c diff.mnemonicprefix=false \
       -c core.quotepath=false \
       -c credential.helper=sourcetree \
       fetch --prune origin
  ```

### 커밋 메시지

- [좋은 커밋 메시지를 작성하기 위한 7가지 약속](https://meetup.toast.com/posts/106)
- [좋은 커밋 메시지를 위한 영어 사전](https://blog.ull.im/engineering/2019/03/10/logs-on-git.html)

#### 좋은 git 커밋 메시지를 작성하기 위한 7가지 약속

1. 제목과 본문을 한 줄 띄워 분리하기
2. 제목은 영문 기준 50자 이내로
3. 제목 첫글자를 대문자로
4. 제목 끝에 . 금지
5. 제목은 명령조로
6. 본문은 영문 기준 72자마다 줄 바꾸기
7. 본문은 어떻게보다 무엇을, 왜에 맞춰 작성하기

### 참고
- [편리한 git alias 설정하기](https://johngrib.github.io/wiki/git-alias/)
