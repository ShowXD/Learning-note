# KNN & SVM

## Non-Parametric Methods
### KNN
#### 特性
* lazy method <-> eager method

##### Pros
* 不需要training

##### Cons
* storage demanding
* sensitive to outliers
* 需要解決missing data的問題

#### 核密度估計 (Parzen windows and kernels)
* Binary
  * 所有的點加起來成為K

##### Parzen window
* 越遠相參照度越低
* 與原先的硬邊界變成模糊邊界
* 每個func都使用一個kernel決定

#### Loacl models
`觀察所有的點與預測的點的關係`

## Support Vector Machines
`...極少案例...`

## SVC
### Model
$F = {f:f(x;w,b) = w^T x + b}$

### separating hyperplane

## Slacks
## Nonlinear SVC
## Dual Problem
## Kernel Trick
