# Ubuntu
## 裝設 Apache 及 phpMyadmin 的指令
1. 取得更新列表

```
sudo apt-get install update
```

2. 安裝更新

```
sudo apt-get install upgrade
```

3. 安裝 apache

```
sudo apt install apache2
```

4. 安裝 php7.4 版

```
sudo apt-get install php7.4
```

5. 安裝 mysql

```
sudo apt-get install php7.4-mysql
```

6. 安裝 php-curl

```
sudo apt-get install php-curl
```

7. 重新啟動 apache

```
sudo service apache2 restart
```

8. 安裝 mysql-server

``` 
sudo apt-get install mysql-server
```

9. 安裝 php-mbstring

```
sudp apt-get install phpmyadmin php-mbstring
```

```
cd /var/www/html
```

```
sudo ln -s /usr/share/phpmyadmin
```
