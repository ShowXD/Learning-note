# 死結和飢餓情形(Deadlock and Starvation)

## 死結(Deadlock)
### 可能發生的情況
* 如果在 receive  時堵塞... (Deadlock occurs if receive is blocking)

`Ex:`
 
|Program 1(P1)| |Program 2(P2)|
|:---|---|:---|
|...| |...|
|Receive(P2);| |Receive(P1);|
|...| |...|
|Send(P2, M1);| |Swnd(P1, M2);|

### 條件(Condition for Deadlock)
1. Mutual exclusion
2. Hold-and-wait
3. 不可搶奪(No preemption)
4. 互相等待(Circular)

### 對付的方法
* prevention
> 消除其中一個condition
* avoidance
> 根據資源分配的當前狀態做出適當的動態選擇
* detection
> 嘗試檢測 Deadlock 的存在並採取措施恢復


#### Safe State

||R1|R2|R3|
|:---:|:---:|:---:|:---:|
|P1|3|2|2|
|P2|6|1|3|
|P3|3|1|4|
|P4|4|2|2|
▲ Claim matrix **C**

||R1|R2|R3|
|:---:|:---:|:---:|:---:|
|P1|1|0|0|
|P2|6|1|2|
|P3|2|1|1|
|P4|0|0|2|

||R1|R2|R3|
|:---:|:---:|:---:|:---:|
|P1|2|2|2|
|P2|0|0|1|
|P3|1|0|3|
|P4|4|2|0|
