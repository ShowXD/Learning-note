# 第6章：挖掘頻繁 Pattern、關聯和相關性：基本概念和方法

### 甚麼是 Pattern
`在DataSet中經常一起出現的一組項目、子序列或子結構`
#### 例子
* 哪些產品一起購買
* 購買iPad後的後續購買是什麼

### K-Itemsets
`Itemsets:一個組合`
* k-itemset: X = {x₁, ..., xᵏ}
> ex: {Beer, Nuts, Diaper} 是3-itemset

|Tid|購買的物品|
|---|:---:|
|10|Beer, Nuts, Diaper|
|20|Beer, Coffee, Diaper|
|30|Beer, Diaper, Eggs|
|40|Nuts, Eggs, Milk|
|50|Nuts, Coffee, Diaper, Eggs, Milk|
***

#### **absolute** support of X
`交易中X出現的頻率`
> ex: sup{Beer} = 3 </br>
> ex: sup{Diaper} = 4 </br>
> ex: sup{Beer, Diaper} = 3 </br>
> ex: sup{Beer, Eggs} = 1 </br>

#### **relative** support of X
`交易中包含X的機率`
> ex: s{Beer} = 3/5 = 60% </br>
> ex: s{Diaper} = 4/5 = 80% </br>
> ex: s{Beer, Eggs} = 1/5 = 20% </br>

### 集合
> 令A、B為兩個集合，A的任意元素都是B的元素
* 子集(subset) </br>
`A為B的子集`
* 超集(superset) </br>
`子集(subset)的相反，A⊆B`
* 真子集(powerset) </br>
`A 為 B 的真子集，A⊆B 且A≠B`

### 預前排除(Apriori pruning)
`如果一個集合沒有頻繁出現，那麼這個集合的超集合就不應該生成，因為不可能頻繁`
> 令 a、b、c 為三個集合
> 假設 ab ∈ F、ac ∈ F、bc ∉ F </br>
> 那麼abc就不可能為 F

### 探勘關聯規則
1. 基於Level、Join的方法：Apriori
2. Vertical data format 的方法：Eclat
3. 頻繁模式投影和增長：FPgrowth

#### Apriori Algorithm
`ex: 現有一個ItemSet，我們對其進行 Apriori:`

|Tid|Items|
|---|:---:|
|10|A,C,D|
|20|B,C,E|
|30|A,B,C,E|
|40|B,E|

***
`1. 第一次掃描，得 C1 為:`
|Itemset|Sup|
|:---:|:---:|
|{A}|2|
|{B}|3|
|{C}|3|
|{D}|1|
|{E}|3|

***
`2. 定義最少的購買次數為2，所以可得F1:`
|Itemset|Sup|
|:---:|:---:|
|{A}|2|
|{B}|3|
|{C}|3|
|{E}|3|

***
`3. 依照可能的子集合，可得C2`
|Itemset|
|:---:|
|{A,B}|
|{A,C}|
|{A,E}|
|{B,C}|
|{B,E}|
|{C,E}|

***
`4. 第二次掃描`
|Tid|Sup|
|---|:---:|
|{A,B}|1|
|{A,C}|2|
|{A,E}|1|
|{B,C}|2|
|{B,E}|3|
|{C,E}|2|




