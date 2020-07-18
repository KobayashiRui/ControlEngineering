#ベジェ曲線描画スクリプト
from scipy.special import comb
import numpy as np
import matplotlib.pyplot as plt

def bernstein(n, i, t):
    return comb(n, i) * t**i * (1 - t)**(n-i)

def bezier(n, t, q):
    p = np.zeros(2)
    for i in range(n + 1):
        p += bernstein(n, i, t) * q[i]
    return p

#制御点の座標
#q = np.array([[0, 0], [1, 1], [2, 1], [3,1],[4,-1], [5, 0]], dtype=np.float)
q = np.array([
    [-200.0, -500.0], 
    [-280.5, -500.0], 
    [-300.0, -361.1], 
    [-300.0, -361.1], 
    [-300.0, -361.1], 
    [0.0, -361.1], 
    [0.0, -361.1], 
    [0.0, -321.4], 
    [303.2, -321.4], 
    [303.2, -321.4], 
    [282.6, -500.0], 
    [200.0, -500.0]], dtype=np.float)

list = []
for t in np.linspace(0, 1, 100):
    list.append(bezier(len(q)-1, t, q))
P = np.array(list)

plt.plot(P.T[0], P.T[1])
plt.plot(q.T[0], q.T[1], '--o')
plt.ylim(-600, -200)
plt.xlim(-400, 400)

plt.show()

