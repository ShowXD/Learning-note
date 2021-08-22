# SSH
* SSH是一種網路協議，用於電腦之間的加密登入。

## 安裝方法
```
sudo apt-get install openssh-client
```

## 配置方法
1. 安裝SSH伺服器端
```
sudo apt-get install -y openssh-server 1
```

## 基本操作
### 遠端登入(使用者名稱為 user ，IP地址為 192.168.1.1)
* 直接登入
```
ssh user@192.168.1.1
```

* 登入特定 port (預設為 22 port)
```
ssh user@192.168.1.1 -p 22
```

### 公鑰登入
1. 生成公鑰
> 存放在 home/.ssh
```
ssh-keygen
```

##　資料傳輸
