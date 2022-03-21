### Tips
- [CLI로 nginx access.log error.log 파싱하기](https://easyengine.io/tutorials/nginx/log-parsing/)
- Nginx URL 카운트
  ```bash
  awk '{print $9}' access.log | sort | uniq -c | sort -rn
  ```
- 현재 열려있는 포트 확인 및 닫기
  ```bash
  # 열린 포트 확인
  sudo lsof -PiTCP -sTCP:LISTEN
  # 특정 포트 닫기
  sudo lsof -i :3000
  sudo kill -9 PID
  ```

### 문제 해결
- [python error: Could not import the lzma module](https://snepbnt.tistory.com/entry/python-error-Could-not-import-the-lzma-module-Your-installed-Python-is-incomplete)
