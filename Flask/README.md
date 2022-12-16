# Flask

## 環境
* Python=3.8
* Flask=2.0.3
* IDE = PyCharm


## 網頁路由(route)
- 指定傳入值的變數
```
@app.route('/hello/<username>')
def hello_user(username):
    return "Hello, " + username
```

- 指定傳入值的變數型態: 例: int
```
@app.route('/hello/<int:userid>')
def hello_userid(userid):
    return "Hello, " + userid
```
