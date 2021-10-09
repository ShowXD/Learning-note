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
