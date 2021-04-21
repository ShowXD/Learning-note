# Decorator-learning-note

- 在已經完成的函式用簡單的方式來修改並重新定義
- 將傳入的函式進行"修飾"後，再 return 出去

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
