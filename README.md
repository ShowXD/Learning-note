# Django-learning-note

##### REST API (Representational State Transfer)
- 一種網路架構

##### CRUD (Create, Retrieve, Update, Delete)

## APP
- 一個功能，一個APP

- 新增一個APP
```
python manage.py startapp XXX
```

## URL
- 網址位址
1. import 你所寫view裡面的功能
```
from (APP 名稱).views import (def 名稱)
```
3. 設定路徑
- 設定好後打localhost/hello
```
path('(想要的名稱 hello)/', 哪個功能的 view),
```

## Models
- 定義資料庫裡的結構(schema)，後透過 Django 裡的指令來建立資料庫
- 預設資料庫為 SQLite ，欲更改請到 setting.py

### models.TextField(default="XXX")
- 設定加入資料時的默認值

### models.DataTimeField(auto_now=True)
- 更新你每次修改的時間

### models.DataTimeField(auto_now_add=True)
- 什麼時候創造的

### XXX.object.get(pk=3)
- PK 為 Primary Key，一般是指 ID

## 資料庫
- 預設會自動加入 ID 欄位
### Migrations
- 紀錄你在檔案裡更新哪些東西(Models.py)
- 紀錄
```
pythom manager.py makemigrations
```

### Migrate
- 根據 Migrations 所建立的檔案去更新你的 Database
- 執行
```
python manage.py migrate
```
