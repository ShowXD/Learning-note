# 事件處理

## 在安裝的虛擬環境中缺少模組包

1. 進入虛擬環境
```
source Industry_Academy/venv/bin/activate
```

2. 使用 Django 內建的 manage.py 進行檢查
```
python manage.py check
```

3. 改變 log 檔案權限
```
777 logs
```

4. 安裝所需的套件(此為此計畫已安裝的模組列表)
```
pip install -r requirements.txt
```

5. 重新讀取虛擬環境
```
sudo service apache2 reload
```

## deplement 問題
* 當設定 Deployment 時，倘若勾選 Visible only for this project 會自動產生新的"錯誤"的設定檔，因此需刪除。
* Python interpreter需選定正確的(/tmp 是錯誤的 Path Mapping)

## Unknown column '' in 'field list'
1. 進入虛擬環境
```
source Industry_Academy/venv/bin/activate
```

2. 使用 Django 內建的 manage.py 對資料庫進行重新尋找更改
```
python manage.py makemigrations
```

3. 使用 Django 內建的 manage.py 資料庫進行更新
```
python manage.py migrate
```

