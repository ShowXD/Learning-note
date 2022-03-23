# 人工智慧

### 梯度下降(Gradient descent)
1. Start with random values
2. Slightly move $θ_0$ and θ1 to reduce J(θ0, θ1)
3. Keep doing step 2 until converged

### 早停法(Early stop)
`透過調整 learning rate 用來幫助又快又精準的找到最佳解`

### 需要停止學習的時機
* Improvement drops
* Reached small error
* Achieved predefined # of iterations
* No time to train anymore

### 解決 overfitting 的問題
* 降低features的數量
* Regularzation: 維持現有的features，但降低不重要feature的影響力


## 常見的縮寫
* Features `x`
* Target `y`
* Prediction `ŷ`
* Parameters `θ`
* Learning rate `α`

## 資料前處理

### One-hot encoding
`無序類別`
* 可用來全數都可分類的問題上

### Label encoding
`有序類別`
* 會有數值遠近的問題
* 維度不多時使用

`Ex:`
```
from sklearn.precrocessing import LabelEncoder
```

## 神經網路
`粗略簡介各神經網路的特點`
### Linear regression

### 
