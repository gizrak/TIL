### Get Started

1. [.gitconfig](.gitconfig) 파일을 생성
   ```bash
   $ cd ~
   $ vi .gitconfig
   ```
1. [git-diff](git-diff) 파일을 Path 실행 경로에 생성
   ```bash
   $ cd bin
   $ vi git-diff
   $ chmod +x git-diff
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
