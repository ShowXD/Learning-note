# 人工智慧
## 常用的 Optimizer
* SGD - Stochastic Gradient Descent
* Adagrad - Adaptive Learning Rate
* RMSprop - Another Adaptive Learning Rate optimizer
* Adam - RMSprop + Momentum
* Nadam - Adam + Nesterove Momentum

## 問題分類
* classification
* regression
* clustering
* dimensionality reduction

## 名詞定義
* Accuracy(準確度)
  * 越高不一定越準，越低也不一定越差
    * `ex`: 癌症機率1%，全猜有準確率99%，跟屎一樣

|total population|prediction positive|prediction negative|
|:---:|:---:|:---:|
|condition positive|True Positive(TP)|False Negative(FN)|
|condition negative|False Positive(FP)|True Negative(TN)|

* Precision(正確性)
  * 預測為 postive 中，有多少比例是真的 positive

* F1-score
  * 包括 presicion 和 recall 的數值

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
* 容易受極端值影響

### K nearest Neighbor(KNN)
`拿來作前處理`

#### K Nearest Neighbor Classifier
`K是一項hyperpaarmeter`
* K 代表尋找最近的幾個
  * ex: K=1 找最近的一個就歸類為那類
* K通常為奇數，防止平手的狀況
* 速度快
* 不需要training

### Support vectir machine(SVM)

#### Kernel SVM
`藉由資料轉換成更高維度來進行分類`
* 理論上可無窮大
* 2D 的資料可轉換成 3D 稱為 Kernel
* 經常使用的kernel
  * Linear kernel
  * Polynomial kernal
  * Gaussian(RBF) kernal

#### SVM in Scikit learn(SVR)
`SVM 在 scikit learn 裡面`
* `C`: 控制模型對錯誤的容忍度
* kernel
  * linear
  * poly, 使用`degree`控制模型複雜度
  * rbf, 使用`gamma`控制模型複雜度

### Logistic regression
* 一種分類的方法

#### Multi-class logistic regression
* 別名: softmax function
* Training: apply gradient ascent to updata all tida
* Prediction: find tida that maximizes

## 模型平估(Model Evaluation)

### Mean Square Error(MSE)
* Criticism
  * Not a normalized measure
  * 容易受極端值影響

### Mean Absolute Error(MAE)
* Criticism
  * Not a normalized measure
  * Tend to be influenced by outliers

### Median Absolute Error(MedAE)
* 解決極端值問題
* Criticism
 * Not a normalized measure

### R2 score(coefficient of determination)
* Normalized measure
* Max: 1
* Min: -Infinite


## 如何找出最好tida

### closed form solution
* No cloased form solution for logistic regression

### 梯度下降(Gradient descent)
1. Start with random values
2. Slightly move θ0 and θ1 to reduce J(θ0, θ1)
3. Keep doing step 2 until converged

### 梯度上升(Gradient ascent)

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

### 取log
* 方便計算
* 乘法變加法

