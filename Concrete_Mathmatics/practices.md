# Chapter 1-6

## 題目
<p>
  Some of the regions defined by n lines in the plane are in infinte, while
others are bounded. What's the maximum possible number of bounded
regions?
</p>

## 解法
1. 先從 $l_0$ 開始看
2. 不斷的畫出來
3. 找出規律
4. 規律像 $S_(n-2) = (n-1)(n-2)/2 = L_n - 2n$

$R_n = R_(n-1)+(n-2)$  
$\Rightarrow R_(n-2) + (n-3) + (n-2)$  
$\Rightarrow 1 + 2 + ... + (n-3) + (m-2)$  
$\Rightarrow \frac{(n-2)(1+(n-2))}{2}$  
$\Rightarrow \frac{(n-2)(n-1)}{2}$  

n|1|2|3|4|5|6|7|8|9|10
---|---|---|---|---|---|---|---|---|---|---
$S_n$|1|3|6|10|15|21|28|36|45|55

n|0|1|2|3|4|5
---|---|---|---|---|---|---
Bounded $R_n$|0|0|0|1|3|6|10

# Chapter 1-8

## 題目
<p>
Solve the recurrence
$Q_0 = \alpha; Q_1 = \beta;$  
$Q_n = (1 + Q_(n-1))/Q_(n-2)$
</p>
