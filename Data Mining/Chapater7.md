# 第7章-Advanced Frequent Pattern Mining
* Mining Diverse Pattens
* Sequential Patten Mining
* Constraint-Based Frequent Pattern Mining

## 多樣化的Pattern
### 多層級的關聯
* 不同的level的關聯

### 多維度的關聯規則
* e.p 牛奶、麵包 是同個 Dimensional

* 如果 itemset A和B 都和密切，但 (s(A U B)s(A) + s(A U B)/s(B)/2) < є

## Frequent Pattern 挖掘

### GSP Agorithm
`步驟:
1. 生成候選人
2. 掃描DB
3. 決定 frequent pattern
4. 重複執行直到沒有候選人
