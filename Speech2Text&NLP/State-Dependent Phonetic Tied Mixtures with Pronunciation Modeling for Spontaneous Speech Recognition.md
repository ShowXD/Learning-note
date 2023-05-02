# State-Dependent Phonetic Tied Mixtures with Pronunciation Modeling for Spontaneous Speech Recognition

## Distance
`執行以下動作的次數`
* delete (-)
* insert (+)
* substition (*)

## Backtrance for computing alignment
`紀錄最有可能的路徑走法`
* 對角線、substition(一樣)
* 水平: insertion
* 垂直: deletion

## Common method for getting short dense vectors
### Word2vec
#### Skip-Gram

##### Negative sampling
$$J(theta) = -\frac{1}{T}logL(theta)=-\frac{1}{T}\sum_{t=1}^{T} \sum_{-m<=j<=m, j!=0}logP(W_{t+j}|w_t;theta)$$

#### prediction function
$$P(o|c)=\frac{exp(u_{o}^{T}v_{c})}{\sum_{wEV}exp(u_{w}^{T}v_{c})}$$
