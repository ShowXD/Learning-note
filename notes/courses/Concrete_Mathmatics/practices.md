# Chapter 1-6
`會考`

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
4. 規律像 $S_{(n-2)} = (n-1)(n-2)/2 = L_n - 2n$

$R_n = R_{n-1}+(n-2)$  
$\Rightarrow R_{n-2} + (n-3) + (n-2)$  
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
Solve the recurrence  
$Q_0 = \alpha; Q_1 = \beta;$  
$Q_n = (1 + Q_{n-1})/Q_{n-2}$

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

$A_n = 2T_n=2(2^n-1)$
$\Rightarrow B_{n} = 4A_{n-1} + 3$
$\Rightarrow 2^{n+2} - 5$

### b

---

# Chapter 1-14

## 題目
<p>
How many pieces of cheese can you obtain from a single thick piece by making five straight slices? (The cheese must stay in its original position while you do all the cutting, and each slice must correspond to a plane in 3D.) Find a recurrence relation for Pn, the maximum number of threedimensional regions that can be dened by n different planes.
</p>

## 解法
`遞迴`

### Two dimensional
$L_n = L_{n-1}+n$  
$\Rightarrow L_{n-2}+(n-1)+n$  
$\Rightarrow L_{n-3}+(n-2)+(n-1)+n$  
$\Rightarrow L_{0}+1+2+\cdots+n$  
$\Rightarrow 1+\frac{n(n+1)}{2}$  

$L_0 = 1$  
$P_0 = 1$  
$L_n = 1 + \frac{n(n+1)}{2}$  

n|0|1|2|3|4|5
:---:|:---:|:---:|:---:|:---:|:---:|:---:
0|1|1|1|1|1|1
1|1|2|3|4|5|6
2|1|2|4|7|11|16
3|1|4|8|15|26

### Three dimensional
答案: $P_n = P_{n-1} + L_{n-1}$  
$\Rightarrow P_{n-2} + L_{n-2} + (1 + \frac{{(n-1)}n}{2})$  
$\Rightarrow P_{n-3} + L_{n-3} + (1 + \frac{(n-2)(n-1)}{2}) + (1 + \frac{(n-1)n}{2})$  
$[帶入n為4]\Rightarrow P_0 + L_0 + (1 + \frac{1*2}{2}) + (1 + \frac{2*3}{2}) + \cdots + (1 + \frac{(n-1)n}{2})$  
$\because(1*2)+(2*3)+\cdots+((n-1)*n) \therefore \frac{n(n+1)(n+2)}{3}$  
$\Rightarrow 1 + 1 + (n-1) + \frac{\frac{(n-1)n(n-2)}{3}}{2}$  
$\Rightarrow 1 + n + \frac{n^3 - n}{6} = \frac{n^3 + 5n + 6}{6}$  
$\therefore 證明了P_n = P_{n-1} + L_{n-1}$是對的

---

# Chapter 2-16

## 題目
Prove that $x^\underline{m}/(x - n)^\underline{m} = x^\underline{n}/(x-m)^\underline{n}$, unless one of the denominators is zero.

## 解法
`參照2.52的式子即可求出`  
[P.65](https://www.csie.ntu.edu.tw/~r97002/temp/Concrete%20Mathematics%202e.pdf)  
$x^{\underline{2-3}} = x^{\underline 2}(x-2)^{\underline{-3}} = x(x-1) \frac{1}{(x-1)x(x+1)} = \frac{1}{x+1} = x ^{\underline{-1}}$

### 方法1
$x^\underline{m+n} = x^\underline{m}(x - m)^\underline{n}$  
$\Rightarrow x^\underline{n}(x - n)^\underline{m}$  

### 方法2
When n > 0,  
$x^{\underline n} = x(x-1)(x-2) \cdots (x-n+1)
 = x^{!}/(x-n)^{!}$  
 
When n < 0,  
$x^{\underline n} = 1/(x+1)(x+2) \cdots (x-n)$

When n = 0,  
$x^{\underline n} = 1$
 
### Case 1: n = 0 and m=0
`直接帶入`  
$x^{\underline 0}/x^{\underline 0} = x^{\underline 0}/x^{\underline 0}$

### Case 2: n > 0 and m < 0
`直接帶入`  
$\frac{x^{\underline m}}{(x-m)^{\underline m}} = \frac{\frac{1!}{(x-m)!}}{\frac{(x-m)!}{(x-n-m)!}}$  
$\Rightarrow \frac{x!(x-n-m)!}{(x-n)!(x-m)!}$

$\frac{x^{\underline n}}{(x-m)^{\underline n}} = \frac{\frac{1!}{(x-n)!}}{\frac{(x-m)!}{(x-n-m)!}}$  
$\Rightarrow \frac{x!(x-n-m)!}{(x-n)!(x-m)!}$

### Case 3: n < 0 and m < 0
`assume n <= m < 0`  
$\frac{x^{\underline n}}{(x-n)^{\underline n}} = \frac{\frac{1}{(x+1)-(x-m)}}{\frac{1}{(x-m+1) \cdots (x-n-m)}}$  
$\Rightarrow \frac{(x-n+1) \cdots (x-n-m)}{(x+1)!(x-m)}$

$\frac{x^{\underline n}}{(x-m)^{\underline n}} = \frac{\frac{1}{(x+1)-(x-n)}}{\frac{1}{(x-n+1) \cdots (x-n-m)}}$  
$\Rightarrow \frac{(x-m+1) \cdots (x-n-m)}{(x+1)!(x-n)}$

### Case 4: n < 0 and m > 0
#### sub-case *a*
`m-n>=1`

#### sub-case *b*
`m-n\leq1`

### Case 5: n > 0 and m < 0
`symmertrical to case 4`

---

# Chapter 2-17

## 題目
<p>
Show that the following formulas can be used to convert between rising and falling factorial powers, for all integers m:
</p>

$x^{\overline m} = (-1)^{m}(-x)^{\underline m} = (x-m+1)^{\underline m} = 1/(x+1)^{\underline{-m}}$
$x^{\underline m} = (-1)^{m}(-x)^{\overline m} = (x-m+1)^{\overline m} = 1/(x+1)^{\overline{-m}}$

### 額外補充
* $x^{\overline m}$  
    * $m > 0, x(x-1)(x-2) \cdots (x-m+1)$
    * $m = 0, 1$
    * $m < 0, \frac{1}{(x+1)(x+2) \cdots (x-m-1)(x-m)}$
* $x^{\underline m}$
    * $m > 0, x(x+1)(x+2) \cdots (x+m)(x+m-1)$
    * $m = 0, 1$
    * $m < 0, \frac{1}{(x-1)(x-2) \cdots (x+m+1)(x+m)}$

## 解法
`帶出來比對就會發現相等`

### $x^{\overline m}$
* if m > 0
  * [將-1分別乘進每個元素]  
  $(-1)^{m}(-x)^{\underline m} = (-1)^m(-x)(-x-1) \cdots (-x-m+1)$  
  $=x(x+1) \cdots (x+m-1)$

  * [將(x+m-1)當成x帶入]  
  $(x+m-1)^{\underline m} = (x+m-1)(x+m-1-1) \cdots (x+m-1-m+1)$  
  $=(x+m-1)(x+m-2) \cdots (x+1)(x)$
  $=x(x+1) \cdots (x+m-2)(x+m-1)$
  
  * [分母的(x-1)分別乘入$\frac{1}{x-1}$]  
  $1/(x-1)^{-m} = \frac {1}{\frac{1}{(x-1+1)(x-1+2) \cdots (x-1-k)}}$  
  $=x(x+1) \cdots (x-1-k)$  
  $=x(x+1) \cdots (x+m-1)$

* if m = 0
  * $(-1)^{m}(-x)^{\underline m} = 1$
  * $(x+m-1)^{\underline m} = 1$
  * $1/(x-1)^{-m} = 1$

* if m < 0
  * $(-1)^{m}(-x)^{\underline m} = (-1)^{m}*\frac{1}{(-x+1)(-x+2) \cdots (-x-m)}$  
  $=\frac{1}{(x-1)(x-2) \cdots (x+m)}$
  
  * $(x+m-1)^{\underline m} = \frac{1}{(x+m-1+1)(x-m-1+2) \cdots (x+m-1-m)}$  
  $=\frac{1}{(x+m)(x+m+1) \cdots (x-1)}$  
  $=\frac{1}{(x-1) \cdots (x+m+1)(x+m)}$
  
  * $1/(x-1)^{-m} = \frac{1}{(x-1)(x+1-1) \cdots (x-1-(-m)+1)}$  
  $=\frac{1}{(x-1)(x-2) \cdots (x+m)}$
  

## $x^{\underline m}$
* if m > 0
  * $(-1)^{m}(-x)^{\underline m} = (-1)^m(-x)(-x-1) \cdots (-x-m+1)$  
  $=x(x+1) \cdots (x+m-1)$

  * $x+m-1^{\underline m} = (x-m+1)(x-m+1+1) \cdots (x-m+1+m-1)$  
  $=(x-m+1)(x-m) \cdots (x-1)(x)$  
  $=x(x-1) \cdots (x+m+1)$
  
  * $1/(x-1)^{-m} = \frac {1}{\frac{1}{(x+1-1)(x+1-2) \cdots (x+1-k)}}$  
  $=x(x-1) \cdots (x+1-k)$  
  $=x(x-1) \cdots (x-m+1)$

* if m = 0
  * $(-1)^{m}(-x)^{\underline m} = 1$
  * $(x+m-1)^{\underline m} = 1$
  * $1/(x-1)^{-m} = 1$

* if m < 0
  * $(-1)^{m}(-x)^{\underline m} = (-1)^{m}*\frac{1}{(-x-1)(-x-2) \cdots (-x+m)}$  
  $=\frac{1}{(x+1)(x+2) \cdots (x-m)}$
  
  * $(x-m+1)^{\underline m} = \frac{1}{(x-m+1-1)(x-m+1-2) \cdots (x-m+1-m)}$  
  $=\frac{1}{(x+1) \cdots (x-m-1)(x-m)}$
  
  * $1/(x+1)^{-m} = \frac{1}{(x+1)(x+1+1) \cdots (x+1+(-m)-1)}$  
  $=\frac{1}{(x+1)(x+2) \cdots (x-m)}$

---

# Chapter 2-19
`可能考`

## 題目
<p>
Use a summation factor to solve the recurrence
</p>

$T_0 = 5;$  
$2T_n = nT_{n-1} + 3 \cdot n!, \text{for n > 0.}$

### 額外補充
$S_n = \frac{a_{n-1}a_{n-1} \cdots a_1}{b_n \cdots b_2}=\frac{2^{n-1}}{n!}$
* $T_0 = 5$
* $T_1 = \frac{1 \cdot 5 + 3 \cdot 1}{2}=4$
* $T_2 = \frac{2 \cdot 4 + 3 \cdot 2 \cdot 1}{2}=7$
* $T_3 = \frac{3 \cdot 7 + 3 \cdot3 \cdot 2 \cdot 1}{2}=\frac{39}{2}$
* $T_4 = \frac{4 \cdot \frac{39}{2} +3 \cdot 4 \cdot 3 \cdot 2 \cdot 1}{2}=75$
* $T_5 = \frac{1 \cdot 5 + 3 \cdot 5 \cdot 4 \cdot 3 \cdot 2 \cdot 1}{2}=\frac{735}{2}$  
$\therefore T_n = \frac{n \cdot T_{n-1} + 3 \cdot n!}{2}$

## 解法

### 方法1
1. [同乘$S_n$]  
$2 \cdot \frac{2^{n-1}}{n!} T_n = \frac{2^{n-1}}{n!} \cdot nT_{n-1} + 3\cdot n! \frac{2^{n-1}}{n!}$  
$\Rightarrow \frac{2^n}{n!}T_n = \frac{2^{n-1}}{(n-1)!}T_{n-1} + 3 \cdot 2^{n-1}$  
$\Rightarrow S_n = S_{n-1} + 3 \cdot 2^{n-1}$  
2. 帶入$T_n$  
$T_{n}=$

### 方法2
$[將題目看成]a_nT_n = B_nT_{n-1} + c_n \therefore a_n = 2, b_n = n, c_n = 3 \cdot n!$  
$[同乘S_n]\Rightarrow S_n a_n T_n = S_n b_n T_{n-1} + S_n c_n$  
$[定義S_nb_n=S_{n-1}a_{n-1}]\Rightarrow S_n = S_{n-1} + S_n c_n$  
$\Rightarrow S_n = S_0 + \sum_{i=1}^{n} S_i c_i$  
$\Rightarrow S_0 a_0 T_0 + \sum_{i=1}^{n}S_i c_i$  
$\Rightarrow S_1 b_1 T_0 + \sum_{i=1}^{n}S_i c_i$  

[因為]  
$S_n = S_n a_n T_n$  
$T_n = \frac{S_n}{S_n a_n}$

[所以]  
$\Rightarrow T_n = \frac{1}{S_n a_n} \cdot S_1 b_1 T_0 + \sum_{i=1}^nS_i c_i$  
$\Rightarrow S_n = \frac{a_{n-1}}{b_n} \cdot S_{n-1}$  
$=\frac{a_{n-1}a_{n-2}}{b_n b_{n-1}} \cdot S_{n-2}$  
$=\frac{a_{n-1}a_{n-2} \cdots a_1}{b_n b_{n-1} \cdots b_2}$  
$=\frac{2^{n-1}}{n!}$  
$\Rightarrow T_n = \frac{n!}{2^n} \cdot 1 \cdot 1 \cdot 5 + \sum_{i=1}^n2^{i-1} i! \cdot 3^i!$  
$=\frac{n!}{2^n}(5+3 \sum_{i=1}^{n}2^{i-1})$  
$=\frac{n!}{2^n}(2+3 \cdot 2^n)$  
$=(2^{-n+1}+3)n!$  

---

# Chapter 2-20

## 題目
Try to evaluate$\sum_{n}^{k=0} kH_k$ by th perturbation method, but deduce the value of $\sum_{n}^{k=0}$ instead.

## 解法
$S_n = \sum_{k=0}^{n}kH_k$  
[多加一項]$\Rightarrow S_n + (n+1) = \sum_{0\leq k\leq n+1}kH_k$  
$=\sum_{0\leq k\leq n+1}(k+1)H_k+\frac{1}{k+1}$  
$=\sum_{0\leq k\leq n+1}[(k+1)H_k+1]$  
$=S_n+\sum_{0\leq k\leq n+1}H_k+(n+1)$
  
---


# Chapter 2-21
`會考`  
[2.24]
  
## 題目
Evalute the sums 
$S_n = \sum_{k=0}^{n}(-1)^{n-k}, T_n = \sum_{k=0}^{n}(-1)^{n-k}, \text{and} U_{n} = \sum_{k=0}^{n}(-1)^{n-k}k^2$
by the perturbation method, assuming that $n >= 0$

## 解法
1. 計算$S_n$  

$S_n = \sum_{k=0}^{n}(-1)^{n-k}$  

$S_{n+1} = \sum_{k=0}^{n+1}(-1)^{n+1-k}$  
$\Rightarrow (-1)^{n+1} + \sum_{k=0}^{n}(-1)^{n-k}$  
$\Rightarrow (-1)^{n+1} + \sum_{k=1}^{n+1}(-1)^{n+1-k}$  
$\Rightarrow (-1)^{n+1} + S_n$  

$S_{n+1} = \sum_{k=0}^{n+1}(-1)^{n+1-k}$  
$=\sum_{k=0}^{n}(-1)^{n+1-k} + (-1)^{n+1-n-1}$  
$=-S_n+1$  

$-S_n + 1 = (-1)^{n+1} + S_n$  
$\Rightarrow S_n = \frac{1-(-1)^{n+1}}{2}$  
$=\frac{1+(-1)^n}{2}$

2. 計算$U_n$  

$U_{n} = \sum_{k=0}^{n}(-1)^{n-k}k^2$  

$U_{n+1} = \sum_{k=0}^{n+1}(-1)^{n+1-k}k^2$  
$=\sum_{k=1}^{n+1}(-1)^{n+1-k}k^2$  
$=\sum_{k=0}^{n}(-1)^{n-k}(k+1)^{2}$  
$=\sum_{k=0}^{n}(-1)^{n-k} k^{2}+2 \sum_{k=0}^{n}(-1)^{n-k} k+\sum_{k=0}^{n}(-1)^{n-k}$  
$=U_n + 2T_n + S_n$  

$U_{n+1} = \sum_{k=0}^{n+1}(-1)^{n+1-k}k^2$  
$=\sum_{k=0}^{n}(-1)^{n+1-k}k^2+(-1)^{n+1-n-1}(n+1)^2$  
$=-U_n + (n+1)^2$

$-U_n + (n+1)^2 = U_n + 2T_n + S_n$  
$\Rightarrow U_n = \frac{(n+1)^2 - 2T_n - S_n}{2}$  
$=\frac{(n+1)^2 - (n+1) + S_n - S_n}{2}$  
$=\frac{(n+1)n}{2}$

3. 計算$T_n$  

$T_{n} = \sum_{k=0}^{n}(-1)^{n-k}k$  

$T_{n+1} = \sum_{k=0}^{n+1}(-1)^{n+1-k}k$  
$=\sum_{k=1}^{n+1}(-1)^{n+1-k}$  
$=\sum_{k=0}^{n}(-1)^{n-k}(k+1)$  
$=\sum_{k=0}^{n}(-1)^{n-k}k+\sum_{k=0}^{n}(-1)^{n-k}$

$T_{n+1} = \sum_{k=0}^{n+1}(-1)^{n+1-k}k$  
$=\sum_{k=0}^{n}(-1)^{n+1-k}k+(-1)^{n+1-n-1}(n+1)$  
$=-T_n+n+1$  

$-T_n+n+1 = T_n + S_n$  
$\Rightarrow T_n = \frac{n+1-S_n}{2}$

# Chapter 2-27(未完成)

## 題目
Compute $\Delta(c^{\underline{x}})$, and use it to deduce the value of $\sum_{k=1}^{n}(-2)^{\underline k}$/k.

### 額外補充
$c^{\underline 1} = c$  
$c^{\underline 2} = c(c-1)$  
$c^{\underline 3} = c(c-1)(c-2)$  
$c^{\underline -1} = \frac{1}{c+1}, c^{\underline 0}=1$

## 解法

### 計算Sigma
$\Delta(c^{\underline x}) = \frac{c^{\underline{x+2}}}{c-x}$  
[令c=-2]$\Rightarrow \Delta[(-2)^{\underline{x}}] = \frac{(-2)^{\underline{x+2}}}{(-2)-x}$  
[令x=k-2]$\Rightarrow \Delta[(-2)^{\underline{k-2}}]$  
$=\frac{(-2)^{\underline{(k-2)+2}}}{(-2)-(k-2)}$  
$=\frac{(-2^{\underline k})}{-k}$  
$=-\frac{(-2)^{\underline k}}{k}$  

<p>題目要求:</p>

$\sum_{k=1}^{n}(-2)^{\underline k}$

# Chapter 2-28

## 題目

## 解法
`Sigma之間不能直接調換`

---

# Chapter 2-29

## 題目
Evaluate the sum $\sum_{k=1}^{n}(-1)^{k}k/(4k^2-1)$.

## 解法
1. 因數分解
$$
\frac{k}{4^2-1} = \frac{k}{(2k+1)(2k-1)}
$$
2. 部分分式分解
$$
\frac{k}{(2k+1)(2k-1)} = \frac{A}{2k+1} + \frac{B}{2k-1}
$$
其中A、B是自己假設的，接著同時將等式兩邊同乘(2k+1)(2k-1) -> k = A(2k-1) = B(2k+1)，接著另$k=1&k=-1$並且解方程式得到$A=\frac{1}{4}、B=\frac{1}{4}$可以得到$\frac{k}{4k^2-1} = \frac{1}{4}(\frac{1}{2k+1})+\frac{1}{2k-1}$
3. 帶入原式
$$
\frac{1}{4}\sum_{k=1}^{n}(-1)^k(\frac{1}{2k-1}+\frac{1}{2k+1})
$$

$$
=\frac{1}{4}(-1-\frac{1}{3}+\frac{1}{3}+\frac{1}{5}-\frac{1}{5}-\frac{1}{7} + \cdots + \frac{(-1)^n}{2n-1} + \frac{(-1)^n}{2n+1})
$$

$$
=\frac{1}{4}(-1)+\frac{(-1)^n}{2n+1}
$$

# Chapter 2-30
`老師喜歡出這題`

## 題目
Cribbage players have long been aware that $15 = 7 + 8 = 4 + 5 + 6 = 1 + 2 + 3 + 4 + 5$.Find the number of ways to represent 1050 as a sum of consecutive positive integers.
</br>(The trivial representation 1050 by itself counts as one way; thus there are four, not three, ways to represent 15 as a sum of consecutive positive integers. Incidentally, a knowledge of cribbage rules is of no use in this problem.)

## 解法
梯形公式算總和能夠分成兩項等式，之後看質因數有幾個，有幾種分配方法給(n + l)及 (k - n + 1)

$$
1050 = n + (n + 1) = (n + 2) + ... k
$$  
$$
\Rightarrow \frac{(n+k)(k-n+1)}{2}
$$

$$
2100 = (n + k)(k - n + 1) = 2^2 \cdot 3 \cdot 5^2 \cdot 7
$$
$$
(n + k)、(k - n + 1) 屬於正整數
$$

(n + k)|(k - n + 1)|(n + k) + (k - n + 1) = 2k + 1
:---:|:---:|:---:
1050|2|1052
700|3|703

<p>2k+1 = 1052</p>
<p>2k = 1051</p>
<p>k = 525.5(X)</p>

<p>2k + 1 = 703</p>
<p>2k = 702</p>
<p>k = 351</p>

$\therefore 2*3*2 = 12$

---

# Chapter 3-3
[P.108](https://www.csie.ntu.edu.tw/~r97002/temp/Concrete%20Mathematics%202e.pdf)
## 題目
Evalute $\lfloor \lfloor m \alpha \rfloor n/ \alpha \rfloor$, when **m** and **n** are postive integers and $\alpha$ irrational number greater than n.

## 解法
`fraction 分解`

$\lfloor \lfloor m\alpha \rfloor  n/\alpha\rfloor$  
$\Rightarrow \lfloor (m \alpha - \{m \alpha \})n/\alpha\rfloor$  
$\Rightarrow \lfloor \frac{(mn\alpha-\{m \alpha \}n)}{\alpha}\rfloor$  
$\Rightarrow \lfloor mn-\{m \alpha \}n/\alpha \rfloor$ 

---

# Chapter 3-12
`證明題`

## 題目
Prove that
$\lceil \frac{n}{m} \rceil = \lfloor \frac{n + m - 1}{m} \rfloor$
for all integers n and all postive intergers m.

## 解法
`套3.6的公式`
1. 

$\frac{n}{m} = \lfloor \frac{n}{m} \rfloor + {\frac{n}{m}}$  
$\therefore n = \lfloor \frac{n}{m} \rfloor + (n \mod m), \lfloor \frac{n}{m} \rfloor$

---

# Chapter 3-14
## 題目
Prove or disprove:
$$
(x \mod ny)\mod y = x \mod y, \text{integer} n.
$$

## 解法(代數)
令(x \mod y) = A  
令(x \mod ny) = B  
$\therefore$ (B mod Y) = A  
=> B = ky + A  

$x \mod y = A, x\mod ny = B$  
$\Rightarrow x = py + A, x = q(ny) + B$

$B = x - q(ny)$  
$=py + A - qny$  
$=(p - qn)y + A$  

$B = Ky + A$  
$B \mod y = A$

---

# Chapter 3-19

## 題目
Find a necessary and sucient condition on the real number b > 1 such that
$$
\lfloor log _bx \rfloor = \lfloor log_b\lfloor x \rfloor \rfloor
$$
for all real x>=1.

## 解法
1. 設 $m = \lfloor log_bx \rfloor$
2. 該等式等價於 $m \leq log_b\lfloor x \rfloor < m+1 \Rightarrow b^m \leq \lfloor x \rfloor < b^{m+1}$
3. 如果 b 是整數，那上述自子等價於
  - $b^m \leq x < b^{m + 1}$
  - $log_b(x-1) < m \leq log_bx$，m滿足該條件
4. 如果 b 不是整數，取 x = b
  - $\lfloor log_bx \rfloor = 1$
  - $\lfloor log_b\lfloor x \rfloor \rfloor = 0$，此時結論不成立
5. 因此充要條件 b 是整數

---

# Chapter 3-20

## 題目
Find the sum of all multiples of x in the closed inteval $[\alpha .. \beta]$, whem x > 0

## 解法
$\sum_kkx[a \leq kx \leq \beta]$  
$=x\sum_kk[\frac{\alpha}{x} \leq k \leq \frac{\beta}{x}]$  
$=x[\frac{1}{2}*(\lceil\frac{\alpha}{x}\rceil+\lceil \frac{\beta}{x}\rceil)*(\lceil\frac{\beta}{x}\rceil+\lceil \frac{\alpha}{x}\rceil+1)]$  
$=\frac{x}{2}*(\lceil\frac{\alpha}{x}\rceil\lceil \frac{\beta}{x}\rceil+\lceil\frac{\beta}{x}\rceil\lceil \frac{\beta}{x}\rceil-\lceil\frac{\alpha}{x}\rceil\lceil \frac{\alpha}{x}\rceil-\lceil\frac{\alpha}{x}\rceil\lceil \frac{\beta}{x}\rceil+\lceil\frac{\alpha}{x}\rceil+\lceil \frac{\beta}{x}\rceil)$  
$=\frac{x}{2}(\lceil\frac{\beta}{x}\rceil\lceil \frac{\beta}{x}+1\rceil-\lceil\frac{\alpha}{x}\rceil\lceil \frac{\alpha}{x}-1\rceil)$

---

# Chapter 3-31
`會考`

## 題目
Prove or disprove $\lfloor x \rfloor + \lfloor y \rfloor + \lfloor x + y \rfloor \leq \lfloor 2x \rfloor + \lfloor 2y \rfloor$

## 解法(窮舉法)
令 $x = a + i, y = b + j$  
$\therefore \lfloor x \rfloor = a, \lfloor y \rfloor = b, \lfloor x + y \rfloor = a + b + \lfloor i + j \rfloor$

$\therefore \lfloor x \rfloor + \lfloor y \rfloor + \lfloor x + y \rfloor$
$\Rightarrow a + b + a + b + \lfloor i + j \rfloor$
$\Rightarrow 2a + 2b + \lfloor i + j \rfloor$  

$\therefore \lfloor 2x \rfloor + \lfloor 2y \rfloor$
$\Rightarrow 2a + \lfloor 2i \rfloor + 2b + \lfloor 2j \rfloor$
$\Rightarrow 2a + 2b + \lfloor 2i \rfloor + \lfloor 2j \rfloor$  

最後變成 $\lfloor i + j \rfloor \leq \lfloor 2i \rfloor + \lfloor 2i \rfloor$  
<p>而他可分成</p>

* $\lfloor i + j \rfloor = 0$
  - i, j 都 < 0.5 $\Rightarrow \lfloor 2i \rfloor + \lfloor 2j \rfloor = 0$
  - i, j 一個 < 0.5, 一個 >= 0.5 $\Rightarrow \lfloor 2i \rfloor + \lfloor 2j \rfloor = 1$
  
* $\lfloor i + j \rfloor = 1$
  - i, j 一個 < 0.5, 一個 >= 0.5
  - i, j 都 >= 0.5

---

# Chapter 3-34

## 題目
Let$f(n) = \sum_{k=1}^{n} \lceil lgk \rceil$  
**a** Find a closed form for f(n), when n >= 1.  
**b** Prove that $f(n) = n - 1 + f( \lfloor \frac{n}{2} \rfloor) + f(\lfloor \frac{n}{2} \rfloor)$ for all n >= 1.

## 解法

### a
$f(n) = \lceil lg1 \rceil + \lceil lg2 \rceil + \lceil lg3 \rceil + \cdots + \lceil lgn \rceil$  
令$m = \lceil lgn \rceil$  
$\lceil lg(n+1) \rceil + \lceil lg(n+1) \rceil + \cdots + \lceil lg2^m \rceil$  
$=m+m+ \cdots + m$  
$=(2^m-n)m$

$j = \lceil lgk \rceil$  
$f(n)-(2^m-n)^m = \sum_{j,k}j[j=\lceil lgk \rceil][1 \leq k \leq 2^m]$  
$=\sum_{j,k}j[2^{j-1} < k \leq 2^j][1 \leq k \leq 2^m]$  
$=\sum_{j,k}j[2^{j-1} < k \leq 2^j][1 \leq j \leq m]$  
$=\sum_{j,k}j[2^{j-1} < k \leq 2^j]$  
$\sum_{j=1}^{m}j2^{j-1}$  

$S_n = \sum_{j=1}^{m}j2^{j-1}$  
$S_n + (m+1)2^m = \sum_{j=1}^{m}(j+1)2^j+1$  
$=\sum_{j=1}^{m}j2^j+\sum_{j=1}^{m}2^j+1$  
$=2S_n+2*(2^m-1)+1$  
$\Rightarrow S_n=(m+1)2^m-(2*2^m-2+1)=2^m(m-1)+1$  

$f(n)-(2^m-n)m = 2^m(m-1)+1$  
$\Rightarrow f(n) = 2^m(m-1)+1+(2^m-n)m$  
$=nm-2^m+1$  

### b

---

# Chapter 3-35

## 題目
Simplify the formula $\lfloor (n+1)2n!e \rfloor$ mod n.

## 解法
$B_n = \frac{(n+1)^2n!}{(n+2)!} + \frac{(n+1)^2n!}{(n+3)!} + \frac{(n+1)^2n!}{(n+4)!} + \cdots$  
$=\frac{(n+1)(n+1)!}{(n+2)(n+1)!} + \frac{(n+1)(n+1)!}{(n+2)(n+2)(n+1)!} + \frac{(n+1)(n+1)!}{(n+4)(n+3)(n+2)(n+1)!} + \cdots$  
$ $  

# 會考
$K^3 = K^3 + 3K^2 + K^1$
$\Rightarrow \sum K^\underline3$
