# Django-learning-note

##### REST API (Representational State Transfer)
- 一種網路架構

## APP
- 一個功能，一個APP

- 新增一個APP
```
python manage.py startapp XXX
```

### URL
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

### Models
- 定義資料庫裡的結構(schema)，後透過 Django 裡的指令來建立資料庫
- 預設資料庫為 SQLite ，欲更改請到 setting.py
</br>
-----我是分隔線-----
</br>
- model.DataTimeField(auto_now=True)
</br>更新你每次修改的時間</br>
