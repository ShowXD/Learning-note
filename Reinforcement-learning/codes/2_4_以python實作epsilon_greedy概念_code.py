"""
@author: Jerry
"""
import numpy as np

iterations = 100 #玩的次數
e = 0.5 # Epsilon
N = 4 #機器數量
total_reward = 0 #總獲得獎勵
true_rewards_data = np.random.uniform(low=0, high=0.9, size=N) #初始化機台機率


def e_greedy(true_rewards_data, e):
  if np.random.random() < e:
      random_machine_p = np.random.uniform(low=0, high=0.9, size=N) 
      selector = np.random.choice(range(0,N)) #隨機抽一台
      selector_p = random_machine_p[selector] #隨機獲得那一台的結果
      if selector_p > 0.8:
          reward = 100
      else:
          reward = 0
  else:
    selector = np.argmax(true_rewards_data) #使用一開始最高的獎勵
    reward = 100
  return selector, reward

for t in range(0, iterations):
  selector, reward = e_greedy(true_rewards_data, e)
  total_reward += reward
  print("機器選項",selector, "獎勵",reward)

print("初始化中獎機率：",true_rewards_data)
print("總獎勵：",total_reward)

