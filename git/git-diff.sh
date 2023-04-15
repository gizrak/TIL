## git-diff.sh

- 파일: `~/bin/git-diff.sh`
- 두 브랜치에 각각 존재하는 커밋이 뭔지 프린트

```bash
#!/bin/sh

BRANCH1=$1
BRANCH2=$2

if [ "$#" -ne 2 ]; then
	echo "USAGE: ${0##*/} [BRANCH1] [BRANCH2]"
	exit -1
fi

echo "Commits that exist in ${BRANCH2} but don't exist in ${BRANCH1}"
git --no-pager log ${BRANCH1}..${BRANCH2} --oneline
echo
echo "Commits that exist in ${BRANCH1} but don't exist in ${BRANCH2}"
git --no-pager log ${BRANCH2}..${BRANCH1} --oneline
```
