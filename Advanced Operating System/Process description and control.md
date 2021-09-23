# 高等作業系統(Advanced Operating System)
Process description and control

# 開機(Boot)

# 執行(Process)
## 定義(Definitions of Process)

## (Process control block)[PCB]

## (Trace of process)

## 範例(Example)

## 終止的理由(Reasons for process termination)


# 暫停(Suspended)
* Block/Suspend
* Ready/Suspend

## 暫停的理由(Reasons for process suspension)

# 作業系統架構(Operating system control structures)

## Memory tables
## I/O tables
## File tables
* 作業系統不一定會去管這些 management 

## Process tables
### Process Creation
1. 給予ID
2. Allocate space
3. 初始化控制系統
4. Set up appropriate
5. Create or expand other data structures

### Switch a process
* Clock interrupt
* I/O interrupt
* Memory fault
* Trap
* Supervisor call

### Process switching
1. 儲存process狀態: program counter、CPU狀態
2. 更新control block: process state、update relevant
3. 
