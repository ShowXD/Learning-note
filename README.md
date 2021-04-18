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
