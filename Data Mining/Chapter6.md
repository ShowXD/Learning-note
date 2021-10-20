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

***

#### **absolute** support of X
`交易中X出現的頻率`
> ex: sup{Beer} = 3
> ex: sup{Diaper} = 4
> ex: sup{Beer, Diaper} = 3
> ex: sup{Beer, Eggs} = 1

#### **relative** support of X
`交易中包含X的機率`
> ex: s{Beer} = 3/5 = 60%
> ex: s{Diaper} = 4/5 = 80%
> ex: s{Beer, Eggs} = 1/5 = 20%
