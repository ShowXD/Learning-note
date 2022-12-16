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

![image](https://user-images.githubusercontent.com/29877260/208165574-68b3a822-4564-417d-ae97-70904aeaa32b.png)

-----

- 限定獲取資料的方法: `例: GET及POST`
```
@app.route('/hello', method=['GET', 'POST'])
def hello():
    return 'Hello, World!'
```

## 函式(function)
- url_for("變數名稱")
`回傳該變數的url`
```
@app.route('/hello')
def hello():
    return 'Hello, World!'


@app.route('/hello/<username>')
def hello_user(username):
    return "Hello, " + url_for('hello')
```
