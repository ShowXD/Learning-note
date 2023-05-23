# NN and NLM

## The basic
### perceptron
`他的activation function是non linear function`  
![image](https://github.com/ShowXD/Learning-note/assets/29877260/b1024c98-cffb-4f80-82f6-d5cef18c5402)

### rectified
` `  
![image](https://github.com/ShowXD/Learning-note/assets/29877260/1eb411b1-0c68-4008-b94d-ef05c227c8e9)

## Backprop algorithm
`相同東西的步驟分一樣`

* input:
$$
(x^{(n)},y^{(n)}) and \theta
$$

* Forward pass
$$
a^{(0)} \Leftarrow [1 x^{(n)}]^T;
for k \Leftarrow
$$
* Backward pass

### gpu speed up
* large width $(D^{(k)})$ at each layer
* larger batch size
* ~~more deep network~~

## 決定 Sigmoid 或 Softmax
1. vanishing gradient problem
`都會小於0.2`  
$$
\theta_j^{(k)}=(\sum_S\theta_S^{(k+1)} \ cdot W_j,s^{(k+1)})act'(z_j^{(k)})
$$
2. asdf
