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
#### Model
##### Continuous Bag of Words(CBOW)
`predict center word from bag of context words`

##### Skip-Gram
`predict context outside words position independent given center word`

#### Training
##### Negative sampling
$$J(\theta) = -\frac{1}{T}logL(\theta)=-\frac{1}{T}\sum_{t=1}^{T} \sum_{-m<=j<=m, j\neq0}logP(W_{t+j}|w_t;\theta)$$

#### prediction function
$$P(o|c)=\frac{exp(u_{o}^{T}v_{c})}{\sum_{w \epsilon V}exp(u_{w}^{T}v_{c})}$$

##### gradient descent
##### loss function
* sigmoid
$$f(x)=\frac{1}{1+e^{-x}}=(\frac{1}{1+e^{-x}})^{'}=\frac{0-[1 \cdot (-1) \cdot e^{-x}]}{(1+e^{-x})^2}=\frac{1 \cdot e^{-x}}{(1+e^{-x})^2}=\frac{1}{1+e^{-x}} \dot $$


