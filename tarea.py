import matplotlib.pyplot as plt
import numpy as np

def func(x,p):
    ans = None
    y = pow((1-pow(abs(x),p)), 1/p)
    return y

p = 2
x = np.linspace(-1, 1, 500)
y, y2 = [], []
for i in range(len(x)):
    val = func(x[i],p)
    y.append(val)
    y2.append(-val)

plt.plot(x,y,'r', label='Norma p={0}'.format(p))
plt.plot(x,y2,'r')
plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.05), ncol=4)
plt.grid()
plt.show()
