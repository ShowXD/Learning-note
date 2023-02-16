# Recurrents Problems

## Chapter 1
### The Tower of Hanoi
`Q: How many moves are necessary and sufficient to perform task?`  
$T_1 = 1, T_2 = 3$  
$T_n = 2T_{n-1} = 2(2^{n-1}) + 1 = 2^n - 1$

### Lines in the Plane
`Q: What is the max. no. L_n of region defined by n lines in the plane?`  
`(first solved in 1826, by the Swiss mathmatician Jacob Steiner)`  
$2^n - 1, n(n+1)/2, n!$

### The Josephus Problem
> In our variation, we start with n people numbered 1 to n around a circle, and we elminate every second remaining  person until only survives.  
> ex: The elimination order is 2, 4, 6, 8, 10, 3, 7, 1, 9. So 5 survives  
`Q: Determine the survivor's number. J(n)`


