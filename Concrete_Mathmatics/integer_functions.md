# Integer Functions

## Floors and ceilings
* $\lfloor x \rfloor$ (floor) = 小於等於 x 的最大整數
  * ex: [3.8] = 3
* $\lfloor x \rfloor$ (ceiling) = 大於等於 x 的最小整數
  * ex: [3.8] = 4
* {x} (the fractional part of x) = 取 x 的小數
  * ex: {3.8} = 0.8

## Floor/ceiling applications

## Floor/ceiling recurrences
### Josephus problem
`作者讓你看一下，不會考`
<p>1到n重新編號，得出N之後即可依序帶入數字，直到小於10即可獲得原始號碼。</p>

## "Mod": The binary operation
## Floor/ceiling sums
### (1)
`假設答案為m`
<p>因$(m+1)^2$及$n$都大於$k$，因此需要$k<(m+1)^2<=n$和$k<n<(m+1)^2$相加</p>

### (3) Omitted
`問題: 為什麼知道要帶(12, 8)?`
<p>因最後的數列為整數，前面的 x+kn mod m 有floor， 所以 kn-kn mod m 為整數。</p>
<p>套用 m=12, n=5 帶入計算、套用 m=12, n=8 帶入計算可找出規律，最後用 d 代表可得出
$$\frac{x}{a} =  A, \frac{m}{a} = B$$
$$\lfloor A \rfloor = \lceil \frac{A}{B} \rceil + \lfloor \frac{A+1}{B} \rfloor$$
