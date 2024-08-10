# Number Theory
## Divisibility(因數)
`知道概念就行`
* $\because m \text{除得盡}n，\therefore m \text{為} n \text{的倍數}$
* 證明 gcd(m, n) = gcd(n mod m, m)
* Sigma 除得盡符號時的應用

## Primes(質數)
`一個數的因數只有1和自己，這個數就是質數`
* 證明如果一個數可由質數所構成，則可從質數的倍數去尋找gcd

## Prime examples(質數舉例)
* 證明質數無限
* 嘗試找出公式能夠找出質數

## Factorial factors
* n階層在數學表達為
* $\in _2 (10!) = 8 \Rightarrow \text{2的幾次方除得盡10階層的意思}$
  * $\in_3(20!) = \lfloor \frac{20}{3} \rfloor + \lfloor \frac{20}{9} \rfloor$
  $\implies 6 + 2$

## Relative primality(最簡分數)
* 找出了一項能獲得所有最簡分數的規律。方法: 兩個分數的分母和分子相加
### 證明為什麼成立
  * fact2: 不等式可拆為兩項不等式來比較
  * fact3: $\bot$ 是互質的意思， $m^\prime + n^\prime + m+n\leq a+b$
### 快速解法:
$$
\frac{m}{n} = \frac{5}{2}
$$
$$
\implies m = 5, n = 7 \Rightarrow m < n ，所以L
$$
$$
\implies m = 5, n = 2 \Rightarrow m > n ，所以R
$$
$$
\implies m = 3, n = 2 \Rightarrow m > n ，所以R
$$
$$
\implies m = 1, n = 2 \Rightarrow m < n ，所以L
$$

## Independent residues(單獨餘數)
`通常除數很大時我們無法快速得知餘數的值`

### 將除數分開去除
* 方法:
  * 
* 條件:
  * 分出來的數為 $\bot$
* 範例:
  * x mod 15，15分為3和5去除

## Additional applications
gcd(a,b)，代表d是能夠整除a,b的最大正整數，也代表a和b能夠被d整除  
$\equiv$代表餘數的意思  
ex: 27除以15會1...12 => $12 \equiv 27 \mod 15$

## 發現
$$
jn \equiv kn (\mod m) \Longleftrightarrow j(n/d)(\mod m/d)
$$

## 範例
* 0 mod 15 = 0
* 9 mod 15 = 9
* 18 mod 15 = 3
* 27 mod 15 = 12

## PHI
* Euler's totient function(歐拉總計函數)  
`小於m且於m互質得數字之數量`  
ex: $\phi(m) = 4$

* Fermat's theorem 費馬定理  
` `
$$
n^{\phi(m)} \equiv 1(\text{mod } m), \text{if } n \bot m
$$

### phi特性
1. 
$$
\phi(m) = \phi(m_1)\phi(m_2)
$$
ex: $\phi(12) = \phi(3)\phi(4) = 2 \cdot 2 = 4$

2. 
$$
f(m) = \prod_pf(p^{m_{p}}), \text{if } m = \prod_pp^{m_{p}}
$$

3. 
The fraction $\frac{m}{n}$ is basic, if 0 <= m < n

ex:  
m = 12  
m has:  
$\frac{0}{12},\frac{1}{12},\frac{2}{12},\frac{3}{12},\frac{4}{12},\frac{5}{12},\frac{6}{12},\frac{7}{12},\frac{8}{12},\frac{9}{12},\frac{10}{12},\frac{11}{12}$  
約分  
$\Rightarrow\frac{0}{1},\frac{1}{12},\frac{1}{6},\frac{1}{4},\frac{1}{3},\frac{5}{12},\frac{1}{2},\frac{7}{12},\frac{2}{3},\frac{3}{4},\frac{5}{6},\frac{11}{12}$  
把分母同樣的組成一組可以變成  
$\Rightarrow \phi(1)+\phi(2)+\cdots+\phi(6)$

4. 
$$
\frac{0}{m},\frac{0}{m},\cdots,\frac{m-1}{m} \text{ for any m.}
\Rightarrow \sum_{d/m}\phi(d) = m
$$

* 證明  
$f(1) = g(1)=1$  
let m > 1 assume 
$f(m_1,m_2)=f(m_1,m_2)$  
when $m_1 \bot m_2$ & $m_1m_2 < m$

### 墨筆鎢絲函數$\mu$

$$
\sum_{d/m}\mu(d)=[m=1]
$$


| m | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| $\mu(m)$ | 1 | -1 | -1 | 0 | -1 | 1 | -1 | 0 | 0 | 1 | -1 | 0 |

### practice 1

#### 題目
Suppose we have beads of n different colors.
goal: count hiw many different ways there are to string them into circular necklaces of length m.  
$\equiv N(m,n)$

#### 方法
