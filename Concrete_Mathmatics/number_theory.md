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
$$\frac{m}{n} = \frac{5}{2}$$
$$\implies m = 5, n = 7 \Rightarrow m < n ，所以L$$
$$\implies m = 5, n = 2 \Rightarrow m > n ，所以R$$
$$\implies m = 3, n = 2 \Rightarrow m > n ，所以R$$
$$\implies m = 1, n = 2 \Rightarrow m < n ，所以L$$

## Independent residues(單獨餘數)
`通常除數很大時我們無法快速得知餘數的值`

### 將除數分開去除
* 條件:
  * 分出來的數為 $\bot$
* 範例: 15分為3和5

###
