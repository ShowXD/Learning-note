# C++

## C++ 函式庫
### iostream
- iostream是C++中用於數據的流式輸入與輸出的頭文件，屬於C++標準程式庫的一部分。 iostream 為Input/Output Stream 的縮寫，即是輸入/輸出流。
```
#include <iostream>
```
### stdio.h
- 定義輸入輸出函式。
```
#include <stdio.h>
```
### algorithm
- 
```
#include <algorithm>
```
### iomanip
- 
```
#include <iomanip>
```
### climits
- 
```
#include <climits>
```

## C++ 常識
### main()
- 為程式的進入點。main () 前面的 int 是整數的意思，表示 這個 C 程式在執行結束時，會傳回一個整數值到作業系統
```
int main() {
  return 0;
}
```
### std
- 名稱空間標示符，C++標準庫中的函式或者物件都是在名稱空間std中定義的，所以我們要使用標準函式庫中的函式或物件都要使用std來限定。
```
std::
```
### cin
- cin主要用於從標準輸入讀取資料
```
cin>>a;
```
### cout
- cout 是預設的 output stream 的名稱, 代表標準輸出(顯示器)。
```
cout<<a;
```
#### fixed
- 固定浮點數顯示的位數
```
<<fixed
```
#### setprecision
- 顯示多少數字
```
<<setprecision(3)
```
#### setw
- 設定之後的顯示會有幾格
```
<<setw(2)
```
### return
- 函數值為 0 。
- 終止程式執行。
```
return 0;
```

## C++ 常用程式碼
### 判斷式
#### if
```
if(a < 10) {

} else if (a > 10) {

} else if (a == 10 && b > 0) {

} else {

}
```
##### if(b)
```
if(b){
  cout<<"b==0";
}else{
  cout<<"b!=0";
}
```

### 迴圈
#### for
```
for(int i = 0; int < 10; i++){
 }
```
 
#### while
```
while(true){
}
```
```
while(a < 10){
}
```
##### while(1)
```
while(1){
  cout<<"1==true";
}
```
##### while(n--)
```
int n = 5;
while(n--){
  cout<<n;
}

OUTPUT:
43210
```
##### while((a = cin.get() != EOF))
```
while((a = cin.get() != EOF)){
  cout<<"當檔案尚未讀取結束時都會一直讀取"
}
```

### 資料型態
#### 整數
- short
- int
- long
- long long
#### 浮點數
- float
- double 
- long double
#### 字元
- char
#### 其他
- bool
- array
- pointer
##### vector
- C++標準庫中的一個class
- 等同自動擴展的陣列
- vector.max.size()
- vector.empty()
```
如果 vector 內部為空，則傳回 true 值
```
- vector.swap()
- vector.push_back()
```
新增元素至最尾端
```
- vector.pop_back()
```
刪除元素至最尾端
```
- vector.insert()
```
插入1個或多個元素至vector的任何位置
```
- vector.erase()
```
刪除1個或多個元素至vector的任何位置
```
- vector.clear()
```
清空所有元素
```
