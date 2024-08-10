# Cordova

## 環境建置
### JAVA
- 請務必使用Java jdk 1.8

## Cordova 指令
- 使用Cordova搜尋可用的android平台
```
cordova run android --list
```
- 執行指定的平台
```
cordova run android --target XXX
```
- 建構成APK
```
cordova build android
```

## PhoneGap指令
- 創建專案
```
cordova create (專案名稱)
```

- 加入欲運行的平台
```
cordova platform add android
```

- 欲移除的平台
```
cordova platform remove android
```

- 查看可運行之平台列表
```
cordova platform ls
```

- 查看已加入之Plugin
```
cordova plugin --list
```

- 使用網頁及時預覽畫面
```
phonegap serve
```

## Chrome同步查看手機
```
chrome://inspect/#devices
```

## JavaScript
- 設置顯示區塊的id
```
id = 'result'
```

- 顯示資料
```
document.write("message here");
```

- 按鍵跳出提示方框
```
onClick = "alert('7')"
```

- 藉由ID取得元素
```
onClick="document.getElementById('result').innerHTML = '8'"
```

- 選擇要輸出的地方
```
document,querySelector("選擇器").innerHTML="message here";
```

- DEBUG
```
console.log("message");
```
### 變數宣告
- Object
```
var html5 = {
  "one" : "HTML"
};
```

###  Method 宣告
```
var name = function() {
  // Program
}
```

### 判斷式
```
var c = (a==b)?"yes":"no";
```
等同於:
```
var c = "";
if (a == b)
{
  c = "yes";
}
else
{
  c = "no";
}
```

#### 條件判斷式
- 判斷**型態**以及值是否相同
```
===
```

## Session
### localStorage
#### 儲存值
```
setItem(key, value)
```

#### 取得值
```
getItem()
```

### SessionStorage

## 相機功能
- 於Cordova安裝插件
```
cordova plugin add cordova-plugin-camera
```
## 定位功能
- 於Cordova安裝插件
```
cordova plugin add cordova-plugin-geolocation
```
