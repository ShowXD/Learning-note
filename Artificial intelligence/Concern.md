# Concern
* Data preprocessing
* Hyper-parameters selectioln
* Model selection

## 為什麼需要做 Scaling
* 對KNN來說能夠更加明確對feature來做分類
* Linear regression, logistic regression, SVM 則是幫助 optimization
* 但對 decision tree 和 random forest 不重要

## 為什麼要 Log 或 Exponential
* 使資料原先的偏斜能夠變回正常分布

## Transforming Features
* Min-max scaling: linear scale each feature to the range[-1, 1] or [0, 1]
* Standardize: scale each feature to N(0, 1)
* Robust scaling: scale features by <b>removing the outliears</b>
  * 基本上和 Min-max scaling 類似，但提供更好的範圍給高度偏態分布的資料
  * 不容易受到異常質影響

* Thresholding
* Applying log or exponential function

## 遇到 Missing value 的處理方法
* Categorical
  * 使用出現次數最多的資料填補

* Numerical
  * 用平均值或中位數填補

* 其他進階技巧
  * 利用插值(interpolation)和外推(extrapolation)預測缺失值
