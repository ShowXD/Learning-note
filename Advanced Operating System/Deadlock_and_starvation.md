# 死結和飢餓情形(Deadlock and Starvation)

## 死結(Deadlock)
* 如果在 receive  時堵塞... (Deadlock occurs if receive is blocking)

`Ex:`
 
|P1||P2|
|:---||:---|
|...||...|
|Receive(P2);||Receive(P1);|
|...||...|
|Send(P2, M1);||Swnd(P1, M2);|

```
```
