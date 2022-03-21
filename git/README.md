### Conf
```gitconfig
[core]
  excludesfile = /Users/ted/.gitignore_global
  autocrlf = input
[difftool "sourcetree"]
  cmd = opendiff \"$LOCAL\" \"$REMOTE\"
  path =
[mergetool "sourcetree"]
  cmd = /Applications/SourceTree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
  trustExitCode = true
[user]
  name = Ted Hwang
  email = ted@tedcode.me
[commit]
	template = /Users/ted/.stCommitMsg
[credential]
  helper = osxkeychain
[filter "lfs"]
  clean = git-lfs clean -- %f
  smudge = git-lfs smudge -- %f
  process = git-lfs filter-process
  required = true
[alias]
  co = checkout
  br = branch -vv
  ci = commit
  st = status
  cp = cherry-pick
  cl = clone
  last = log -1 HEAD
  ll = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative
  l = log --graph --oneline --decorate --date=relative
  tr = log --graph --oneline --decorate --all
  visual = !gitk
```

### Tips
- 패스워드 초기화
  ```bash
  git -c diff.mnemonicprefix=false \
       -c core.quotepath=false \
       -c credential.helper=sourcetree \
       fetch --prune origin
  ```
