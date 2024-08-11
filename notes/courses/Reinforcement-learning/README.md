# Reinforcement-learning
 This note is learning from HiSKIO

## 何謂是強化學習
- 針對一種目標嘗試進行學習和嘗試的方法。
- 主要概念是透過有策略地與環境進行互動。
- 強化學習的方式，是利用獎勵的方法，使其想辦法找到最大回報的互動方式。

<p float="left">
  <img src="/images/1.png" width="250vw" />
  <img src="/images/2.png" width="250vw" /> 
</p>

## 強化學習與其他學習的不同
- 相對於監督式學習，無需做標記資料，是透過與環境互動得到的資訊進行學習。
- 相對於非監督式學習，並非尋找資料之間隱藏的關聯性，而是透過獎勵的方式糾正學習的方向。
- 相對於深度學習，不須事先準備大量的資料，利用與環境的互動即時取得資料來學習。

## 強化學習的關鍵
1. **行動獎勵(Reward)**
    - 智能體的目標就是透過行動持續獲得信號
    <br/>
2. **馬可夫決策過程(Markov decision process)**
    - 用來定義整個強化學習的範疇。
    <br/>
3. **評價函數(Value Functions)**
    - 用來評價這個決定的好壞。
    <br/>
4. **學習策略(Policy)**
    - 收集從環境獲得的資訊後，所採取的策略。

## 強化學習的困難點
1. 擬定好強化學習的範疇
2. 過程中探索新方向的權衡取捨
3. 需要不斷嘗試各種動作
4. 花費大量的時間進行運算和Debug

## 強化學習的應用
### 舉例:
1. **機器人**
    - 提升對於新環境的適應能力
    - 在未知的環境，強化學習仍保有他的穩健性
    <br/>
2. **遊戲**
    - 像是星海爭霸、Flappy bird
    <br/>
3. **工業自動化**
    - 改善機器手臂對新物體的抓取成功率
    - 過去透過影像辨識來處理的問題，可透過強化學習進行改善
    <br/>
4. **股票交易**
    - 決定要投資多少倉位、短線還是長線，來給予更好的建議
    <br/>
5. **醫療**
    - 利用影像來判斷病徵或進行開刀
    - 在過去需要大量的影像資料，現在機器學習可以自行找到新的特徵點
    <br/>
6. **交通**
    - 找到每個時間點最佳控制號誌方法
    <br/>
7. **化學**
    - 利用控制實驗條件、參數，找到最好的反應結果
    <br/>
8. **推薦系統**
    - 個人化新聞推薦
    <br/>
9. **廣告策略**
    - 學習廣告投放的方法
    <br/>
10. **深度學習**
    - 神經網路有許多參數需要設定，Google就以此產生出遞迴神經網路(RNN)

### 總結
- 可以自動化學習的方法
- 智能體、環境、獎勵、動作對於強化學習不可或缺
- 困難點在於如何做最佳決策的權衡取捨
- 強化學習具有廣泛的應用能力

## 強化學習的決策過程
### 行動價值
智能體尋找最佳的行動，就必須要定義哪一個行動價值是最高的，這樣的概念就是行動價值。</br>

#### 舉例:
1. 假設智能體是醫生
2. 現在有3(K=3)種診療方法(bandit)可以醫治一位病人
3. 病人受治療後的反饋就是獎勵，看哪一種的成功率比較高

#### 估算方法
行動價值的公式: q(a)=機率* 滿意度+機率* 滿意度</br>

- 行動獎勵就是期望值的概念
- 我們必須不斷地累計過去的經驗，才能持續保持最好的運作結果，因此每一種決策，都有行動的價值

##### 平均法(Sample-Average Method)、(Epsilon-Greedy)
- 將過去的獎勵取平均值
- 用Greedy來取最大的Qt(a)當作結果
- 採用最好的決策方法稱為Greedy Action
- 簡單的說讓每一次的行動，都有最大的收益
</br>缺點:過度依賴得到的結果，會失去嘗試新結果的方法
- Epsilon在強化學習中表示探勘的機率(exploration)
  - 假設Epsilon為0.2
    - 探勘(exploration)有20%機率
    - 利用(exploitation)有80%機率

##### 過程中探索新方向(探勘)與獲取結果(利用)的權衡取捨
- 探勘(exploration)-選擇採用其他管理方法A, B持續探勘新方向
- 利用(exploitation)-選擇既有的管理方法C
</br>
舉例:
- 餐廳要持續試菜還是推出新菜
- 醫生要持續使用新的診療方法，還是決定另一個方法

### 總結
- 缺點:短視報酬
- 行動->獎勵->行動價值
- 行動價值算法->平均法
- 行動價值選擇
  - Greedy action(取最大)
  - Epsilon-Greedy(比Greedy多隨機探索的過程)

### Epsilon-Greedy實作

```
iterations = 100  #玩的次數
e = 0.2  # 探勘的機率
N = 4  # 機器有4台
true_rewards_data = np.random.uniform(low=0, high=0.9, size=N)  # 從0到0.9猜機率(一般來說不太會有100%所以是0.9)
```
```
if np.random.random() < e: # 用新的方法做，每個N臺的機率重新跑一次
 random_machine_p = np.random.uniform(low=0, high=0.9, size=N) # 重設機率
 
 # 隨機拿一台機器出來玩
 selector = np.random.choice(range(0, N))  # 隨機抽一台
 selector_p =random_machine_p[selector]  # 隨機看某一台的結果
 if selector_p > 0.8:
  reward = 100
 else:
  reward = 0
 
else: # 用原本的方法做
 selector = np.argmax(true_reward_data, e)  # 使用一開始最高的獎勵
 reward = 100 # 直接回饋100分
 ...
```

```
for t in range(0, iterations):
 selector, reward = e_greedy(true_reward_data, e) # 運作上方並輸入資料
 total_reward += reward  
 print("機器選項:", selector, "獎勵", reward) # 顯示每次的結果
```
## 馬可夫決策過程
### 概念解析
- 越簡單越好

#### 舉例
1. 智能體做一個動作(Action)，簡稱At
2. 環境回饋一個狀態給智能體(State)，簡稱St+1
3. 環境回饋一個獎勵給智能體(Reward)，簡稱Rt+1

<p float="left">
  <img src="/images/4.png" width="250vw" />
</p>

#### 小結
- 在有限的MDPS(Markov Decision Process)裡，狀態、行動、獎勵都是有限的就能定義成一個公式

<p float="left">
  <img src="/images/5.png" width="250vw" />
</p>

### 建構概念
1. 列出你的所有參數
2. 分類"狀態"、"動作"
3. 決定正負面的"獎勵"

#### 練習
- 溫度控制
  - 參數選項
  1. 溫度
  2. 電燈使用率
  3. 風扇轉速
  - 狀態
  1. 現在溫度比設定溫度低
  2. 現在溫度比設定溫度高
  - 動作
  1. 開/關電燈
  2. 開/關風扇
  - 決定獎勵
    - 當現在溫度比設定溫度低
    1. 開電燈，獎勵+10
    2. 關電燈，獎勵-10
    3. 開風扇，獎勵-1
    4. 關風扇，獎勵+1
    - 當現在溫度比設定溫度高
    1. 開電燈，獎勵-10
    2. 關電燈，獎勵+10
    3. 開風扇，獎勵+1
    4. 關風扇，獎勵-1

## 貝爾曼方程與價值函數
### 價值函數(Value Function)的概念
- 智能體期待的報酬，取決於我們採取的行動
- 每一個狀態，就會有一個價值函數去計算預期收益
- 由於智能體對於我們所決定的每個策略，都會去決定它的價值
- 能夠協助智能體提早掌握當下的狀況，不用等待長期的成果
- 動作價值函數就是協助我們判斷不同策略的品質
<p float="left">
  <img src="/images/6.png" width="250vw" />
</p>
- 價值函數可以分成兩種:</br>
  1. 狀態價值函數(State value functions)</br>
  -> 運作策略下，運行時的狀態值</br>
  </br>
  2. 動作價值函數(Action value functions)</br>
  -> 運作策略下，指定某個動作的價值</br>

### 貝爾曼方程(Bellman Equations)概念
- 是為了解決MDP(馬可夫決策過程)在連續動態運作中的最佳化方程，他的主要工作是將下面函數做一個整併
  - 狀態價值函數V(s)
  - 動作價值函數Q(s,a)
  - 新狀態價值函數V(s')
  - 新動作價值函數Q(s',a')
- 公式:
<p float="left">
  <img src="/images/7.png" width="250vw" />
</p>

#### 狀態價值函數舉例
<p float="left">
  <img src="/images/8.png" width="250vw" />
</p>

#### 動作價值函數舉例
<p float="left">
  <img src="/images/9.png" width="250vw" />
</p>

#### 總結
- 價值函數分為"動作"與"概念"
- 價值策略下，運行間的狀態值為狀態價值函數
- 運作策略下，指定某個動作的價值為動作價值函數
- 透過貝爾曼方程，能夠加動作與狀態兩者在連續過程中做整合，以利運行在MDP的框架中。

## 策略評估(Policy Evaluation)
定義: 用於定義策略的價值。
<p float="left">
  <img src="/images/10.png" width="250vw" />
</p>
### 方法
假設我們現在有個4 * 4的方格，我們要從左上角走到左下角，如果是碰到邊界則停留原地。
1. 我們先算出每一格的價值函數。
2. 創立兩個Array，一個是變動前、一個是變動後，這能使我們更易於分辨。
3. 在V中記錄。每一格都擁有4種選擇方向，因此隨機策略為0.25 ; 然後走一格的獎勵為-1。
4. 將剛剛算出來的狀態價值函數的評估結果更新到V'。
5. 每格都算出來。
6. 之後使用貝爾曼方程k=1，將每一格算出來，他會隨著時間慢慢收斂到策略評估的結果

## 策略迭代
定義: 透過迭代的評估找到最佳策略


##  動態規劃法(Dynamic Programming)
- 利用貝爾曼方程來做策略評估與控制
- 可以在馬可夫上計算最佳策略
- 核心思想是透過**價值函數**來建構做最佳策略的搜尋