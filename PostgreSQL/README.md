# PostgreSQL

## 資料庫外指令
* 
```
pg_ctl initdb
```

* 啟動PostgreSQL
```
pg_ctl start
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
