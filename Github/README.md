# Github 指令操作

## Commit
### 選擇所有已變更的檔案
```
git add .
```

### 編輯要 commit 的內容
```
git commit --amend
```

### 強制 Commit
```
git push -f
```

## 分支
### 新建並切換至新分支XXX
```
git checkout XXX
```

### 拉取所有目前遠端分支
```
git fetch --all
```

### 合併 fetch 下來的遠端分支及本地端分支
```
git merge
```

### 拉取及合併分支
```
git pull
```

### 123
```
git remote -v
```

### 分支合併
1. 開啟 rebase
```
git rebase -i dev(分支的名稱)
```
2. 將pick取代成squash
`假設現在有3個pick，最新的commit訊息是我們目前要commit的Summarize，`
`那麼將最後兩個pick更改為squash。`

```
squash
```

## 其他
### 查看指令歷史
```
history
```

