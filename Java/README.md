# Java

## Extends-implements

* Interface 是一種介面，它就像是一個空殼、模型，沒有真正的執行能力，並沒有被實做出來。</br>

* Implement 通常都會接在需要使用 Interface 的類別後面，它就是用來實作 Interface 的。</br>

* Extend 就是延伸，能夠獲得你extend下來的所有類別，你無法從如空殼般的 Interface 延伸，所以不能直接使用 Interface。</br>
舉例:</br>
1. 我先新增一個類別叫做"test"，裡面有一個函式叫 "meow" 。</br>
2. 好，我們再創一個類別叫做 "success" 並繼承他。</br>
3. 現在把"success"給 new 出來時，裡面就會已經有寫好的 "test" 裡的 "meow" 函式。</br>
