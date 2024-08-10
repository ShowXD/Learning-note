"""
@author: Jerry
"""
import numpy as np

states = 4 #狀態數量
l = 0.8 #折扣率 
iterations = 10 #迭代

r_vector = np.zeros(states) #初始獎勵向量
r_vector[2] = 10 #獎勵向量的第三個狀態加10分
s_value_vector = np.zeros(4) #初始化的狀態向量為4個0

#自己出去的機率是1/2
for i in range(iterations):
  v_s1 = 1/2 * (r_vector[0] + l * s_value_vector[0]) + \
         1/4 * (r_vector[1] + l * s_value_vector[1]) +\
         1/4 * (r_vector[2] + l * s_value_vector[2])+\
         0   * (r_vector[3] + l * s_value_vector[3])
  v_s2 = 1/4 * (r_vector[0] + l * s_value_vector[0]) +\
		     1/2 * (r_vector[1] + l * s_value_vector[1]) +\
		       0 * (r_vector[2] + l * s_value_vector[2])+\
		     1/4 * (r_vector[3] + l * s_value_vector[3])
  v_s3 = 1/4 * (r_vector[0] + l * s_value_vector[0]) +\
		       0 * (r_vector[1] + l * s_value_vector[1]) +\
		     1/2 * (r_vector[2] + l * s_value_vector[2])+\
		     1/4 * (r_vector[3] + l * s_value_vector[3])
  v_s4 =   0 * (r_vector[0] + l * s_value_vector[0]) +\
		     1/4 * (r_vector[1] + l * s_value_vector[1]) +\
		     1/4 * (r_vector[2] + l * s_value_vector[2])+\
		     1/2 * (r_vector[3] + l * s_value_vector[3])
     
  s_value_vector = v_s1,v_s2,v_s3,v_s4
print(s_value_vector)

