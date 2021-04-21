# Decorator-learning-note

- 在已經完成的函式用簡單的方式來修改並重新定義
- 將傳入的函式進行"修飾"後，再 return 出去
- 是以 recursive 的方式執行，因此會以最靠近的為優先處理
- 傳遞參數需先一個 func 進行解析，第二層 func 抓取要 decorated 的 func 才能成功運行

## 範例

### 額外加入程式
- 在前面加入 decorator

```
def print_func_name(func):
    def warp():
        print("Now use function '{}'".format(func.__name__))
        func()
    return warp


@print_func_name
def dog_bark():
    print("Bark !!!")


@print_func_name
def cat_miaow():
    print("Miaow ~~~")


if __name__ == "__main__":
    dog_bark()
    # > Now use function 'dog_bark'
    # > Bark !!!

    cat_miaow()
    # > Now use function 'cat_miaow'
    # > Bark !!!
    
```

### 優先順序
```
def print_func_name(func):
    def wrap_1():
        print("Now use function '{}'".format(func.__name__))
        func()
    return wrap_1

def print_time(func):
    import time
    def wrap_2():
        print("Now the Unix time  is {}".format(int(time.time())))
        func()
    return wrap_2

@print_func_name
@print_time
def dog_bark():
    print("Bark!!!")
    
if __name__ == "__main__":
    dog_bark()
```

### 傳遞參數
```
import time

def print_func_name(time):
    def decorator(func):
        def wrap():
            print("Now use function '{}'".format(func.__name__))
            print("Now Unix time is {}.".format(int(time)))
            func()
        return wrap
    return decorator


@print_func_name(time=(time.time()))
def dog_bark():
    print("Bark !!!")


if __name__=="__main__":
    dog_bark()

```

## Closure
- local scope 的變數在下一層不會清除
- 預設是唯獨

