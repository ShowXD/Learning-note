# Two Sum
## Question
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
</br>
You may assume that each input would have exactly one solution, and you may not use the same element twice.
</br>
You can return the answer in any order.

## 問題
給予一個整數的陣列 nums 以及整數 target，回傳兩個數字的索引使他們加起來成為 target。
</br>
你可以假設每一個 input 只會有一個解法，以及你不會同一個元素使用兩次。
</br>
您可以按任何順序傳回答案。

### Hash Table
雜湊表，簡單來說我們不需要把數值存在陣列裡，之後拿出來還要先排列增加時間複雜度 O(n)，我們可以利用 hash function 將他儲存起來，未來要用到時再利用鍵值快速查詢即可。
