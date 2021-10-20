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
> ex: s{Beer} = 3/5 = 60%
> ex: s{Diaper} = 4/5 = 80%
> ex: s{Beer, Eggs} = 1/5 = 20%
