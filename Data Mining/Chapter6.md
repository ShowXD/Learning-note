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
* 如何生成候選人
1. self-joining
2. pruning

* 如何計算候選人的sup

`ex: 現有一個ItemSet，我們對其進行 Apriori:`

|Tid|Items|
|---|:---:|
|10|A,C,D|
|20|B,C,E|
|30|A,B,C,E|
|40|B,E|

***
`1. 對TDB進行第一次掃描，得 C1 為:`
|Itemset|Sup|
|:---:|:---:|
|{A}|2|
|{B}|3|
|{C}|3|
|{D}|1|
|{E}|3|

***
`2. 定義關聯次數為2，所以刪掉小於的，可得F1:`
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
`4. 依照 C2 集合對 TDB 進行第二次掃描`
|Itemset|Sup|
|---|:---:|
|{A,B}|1|
|{A,C}|2|
|{A,E}|1|
|{B,C}|2|
|{B,E}|3|
|{C,E}|2|

***
`5. 因關聯次數為2，所以刪掉小於的，可得F2:`
|Itemset|Sup|
|---|:---:|
|{A,C}|2|
|{B,C}|2|
|{B,E}|3|
|{C,E}|2|

***
`6. 依照可能的子集合，可得C3`
|Itemset|
|---|
|{B,C,E}|

***
`7. 依照 C3 集合對 TDB 進行第三次掃描`
|Itemset|Sup|
|---|:---:|
|{B,C,E}|2|

#### 改進與替代
1. 減少DB掃描的次數
2. 減少候選人的數量
3. 探索特殊的數據結構

#### Direct Hashing and Pruning(DHP)


## Pattern 評估
`如何判斷這個 Pattern 的 Interestingness(興趣度)`

### 客觀
* 支持(support)
* 信心(confident)
* 相關性(correlation)

### 主觀
* unexpected
* freshness
* timeliness

## 依賴性和相關性的測量
### Lift
> 依賴/相關事件的測量

`公式:`
Lift(B,C) = s(B ∪ C)/s(B) * s(C)

* 如果Lift的數值>1: 正相關
* 如果Lift的數值<1: 負相關

`Ex:`
| |B|¬B|∑row|
|:---:|:---:|:---:|:---:|
|C|400|350|750|
|¬C|200|50|250|
|∑col.|600|400|1000|

```
lift(B,C) = (400/1000)/[(600/1000)*(750/1000)] = 0.89
lift(B,¬C) = (200/1000)/[(600/1000)*(250/1000)] = 1.33
```
### x²
> 觀察值與期望值之間的關係

`公式:`
x² = ∑((觀察值-期望值)²/(期望值))

* 如果x²的數值<0.01: 兩者為獨立的關係

`Ex:`
| |B|¬B|∑row|
|:---:|:---:|:---:|:---:|
|C|400|350|750|
|¬C|200|50|250|
|∑col.|600|400|1000|

```
x² = [(400-450)²/450]+[(350-300)²/300]+[(200-150)²/150]+[(50-100)²/100] = 55.56
```
`通過查閱x²分佈的臨界值表，可以得出結論，B 和 C 獨立的機會非常低 (< 0.01)`

### 例外情況: 無交易(Null invariance)
`交易都沒有 B、C`

`Ex:`
| |B|¬B|∑row|
|:---:|:---:|:---:|:---:|
|C|100|1000|1100|
|¬C|1000|100000|101000|
|∑col.|1100|101000|102100|








