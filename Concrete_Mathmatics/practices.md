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
$\Rightarrow 1 + 2 + \cdots + (n-3) + (m-2)$  
$\Rightarrow \frac{(n-2)(1+(n-2))}{2}$  
$\Rightarrow \frac{(n-2)(n-1)}{2}$  

n|1|2|3|4|5|6|7|8|9|10
---|---|---|---|---|---|---|---|---|---|---
$S_n$|1|3|6|10|15|21|28|36|45|55

n|0|1|2|3|4|5
---|---|---|---|---|---|---
Bounded $R_n$|0|0|0|1|3|6|10

---

# Chapter 1-8

## 題目
<p>
Solve the recurrence
$Q_0 = \alpha; Q_1 = \beta;$  
$Q_n = (1 + Q_(n-1))/Q_(n-2)$
</p>

## 解法
1. $Q_0 = \$

---

# Chapter 1-11

## 題目
<p>
A Double Tower of Hanoi contains 2n disks of n different sizes, two of
each size. As usual, we're required to move only one disk at a time,
without putting a larger one over a smaller one.
a How many moves does it take to transfer a double tower from one
peg to another, if disks of equal size are indistinguishable from each
other?
b What if we are required to reproduce the original top-to-bottom
order of all the equal-size disks in the final arrangement?
[Hint: This is diffcult|it's really a "bonus problem."]
</p>

## 解法

### a
1. 現在有三層，把前兩層搬到C
2. 把最下層搬到B
3. 再把兩層的搬到A
4. 把B搬到C
5. 

$A_n = 2T_n=2(2^n-1)$  
$\Rightarrow B_n = 4A_(n-1) + 3$  
$\Rightarrow 2^(n+2) - 5$  

### b

---

# Chapter 1-14

## 題目
<p>
How many pieces of cheese can you obtain from a single thick piece by making ve straight slices? (The cheese must stay in its original position while you do all the cutting, and each slice must correspond to a plane in 3D.) Find a recurrence relation for Pn, the maximum number of threedimensional regions that can be dened by n different planes.
</p>

## 解法

### Two dimensional
$L_0 = 1$  
$P_0 = 1$  
$L_n = 1 + \frac{n(n+1)}{2}$  

n|0|1|2|3|4|5
---|---|---|---|---|---|---
0|1|1|1|1|1
1|1|2|3|4|5|6
2|1|2|4|7|11|16
3|1|4|8|15|26

### Three dimensional
$P_n = P_(n-1) + L_(n-1)$  
$\Rightarrow P_(n-2) + L_(n-2) + (1 + \frac{{n-1}n}{2})$  
$\Rightarrow P_(n-3) + L_(n-3) + (1 + \frac{{n-2}{n-1}}{2}) + (1 + \frac{(n-1)n}{2})$  
$\Rightarrow P_0 + L_0 + (1 + \frac{1*2}{2}) + (1 + \frac{2*3}{2}) + \cdots + (1 + \frac{(n-1)n}{2})$  
$\Rightarrow 1 + 1 + (n-1) + \frac{\frac{(n-1)n(n-2)}{3}}{2}$  
$\Rightarrow 1 + n + \frac{n^3 - n}{6} = \frac{n^3 + 5n + 6}{6}$

---

# Chapter 2-16

## 題目
<p>
Prove that xm/(x − n)m = x
n/(x − m)
n, unless one of the denominators
is zero.
</p>

## 解法
`參照2.52的式子即可求出`

### 方法1
$x^\underline{m+n} = x^\underline{m}(x - m)^\underline{n}$  
$\Rightarrow x^\underline{n}(x - n)^\underline{m}$  

### 方法2
When n > 0

### Case 1: n > 0

### Case 2: n > 0 and m < 0

### Case 3: n < 0 and m < 0
`assume n <= m < 0`

### Case 4: n < 0 and m > 0

---

# Chapter 2-17

## 題目
Show that the following formulas can be used to convert between rising
and falling factorial powers, for all integers m:
$$$$

# Chapter 2-19

## 題目
<p>Use a summation factor to solve the recurrence
$$T_0 = 5;$$
$$2T_n = nT_(n-1) + 3 \dot n!, \text{for n > 0.}$$

## 解法

### 方法1
$2 \dot \frac{2^(n-1)}{n!} T_n = \frac{2^(n-1)}{n!} \dot nT_(n-1) + 3\dot n! \frac{2^(n-1)}{n!}$

### 方法2
$a_nT_n = BnT_(n-1) + C_n$  
$\Rightarrow S_n A_n T_n = S_n b_n T_(n-1) + S_n C_n$  
$\Rightarrow S_n = S_(n-1) + S_n C_n$  
<p>帶入<\p>
$\Rightarrow S_n = S_0 + \sigma{i=1}{n} S_i C_i$  
$\Rightarrow S_0  a_0 $

$a_n = 2, b_n = n, C_n = 3\dot n!, T_0 = 5$

---

# Chapter 2-20

## 題目
$Try to evaluate \Sigma{n}{k=0} kH_k by th perturbation method, but deduce the value of \Sigma{n}{k=0} instead.$

## 解法
$S_n = \Sigma{n}{k=0}kH_k$  
多加一項$S_n + (n+1)H_(n+1)$
$$
