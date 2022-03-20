# PostgreSQL

## 安裝在 Anaconda 環境
1. 安裝 PostgreSQL
```
conda install -y -c conda-forge postgresql
```

2. 安裝 psycopg
`Psycopg 是 Python 常用的 adapter。`
`它的特點是 Python DB API 2.0 規範實現和線程安全。`

```
conda install -y -c anaconda psycopq2
```

3. 設定 PGDATA
```
set PGDATA={path with stored pgdata folder}
```
4. 初始化

## 基礎知識
* 縮寫解釋
1. -U `username`: 登入資料庫的帳號。
2. -d `dbname`: 要連線的資料庫。
3. -h `hostname`: 運行 Postgresql 的主機名稱。

## 資料庫外指令
* 對資料庫下指令
```
psql -C "command here;" {username}
```

* 
```
pg_ctl initdb
```

* 啟動PostgreSQL
```
pg_ctl start
```

* 登入資料庫
```
psql -U {username} -d {database name}
```

* 導入資料庫
```
psql -U {username} {database name} < {database_name.sql}
```

## 資料庫內指令
`以下指令皆已登入postgres`

* 創建資料庫操作身份
```
CREATE ROLE {name};
```

* 創建資料庫
```
CREATE DATABASE {database name};
```

* 查看並條列所有資料庫
```
\l
```

* 查看並條列指定資料庫的資料表
```
\dt
```

* 登出資料庫
```
\q
```
