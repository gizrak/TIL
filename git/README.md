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

### 참고
- [편리한 git alias 설정하기](https://johngrib.github.io/wiki/git-alias/)
