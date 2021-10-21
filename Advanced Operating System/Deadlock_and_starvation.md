# 死結和飢餓情形(Deadlock and Starvation)

## 死結(Deadlock)
### 可能發生的情況
* 如果在 receive  時堵塞... (Deadlock occurs if receive is blocking)

`Ex:`
 
|P1| |P2|
|:---|---|:---|
|...| |...|
|Receive(P2);| |Receive(P1);|
|...| |...|
|Send(P2, M1);| |Swnd(P1, M2);|

### 條件(Condition for Deadlock)
1. Mutual exclusion
2. Hold-and-wait
3. 不可搶奪
> (No preemption)
4. 互相等待
> (Circular)
