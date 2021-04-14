import numpy as np

def gram_schmidt(B, n):
    m = len(B[0])
    E = []
    #Caso Base
    u1 = B[0] / np.linalg.norm(B[0])
    E.append(u1)

    #Caso Inductivo
    for i in range(1,n):
        xi = B[i]
        sum = np.zeros(m)
        for j in range(i):
            uj = E[j]
            pp = np.dot(xi, uj)
            sum += (pp * uj)
        ui_ = xi - sum
        ui = ui_ / np.linalg.norm(ui_)
        E.append(ui)
    return E

B = [[1,-1,0,1], [1,1,0,1], [0,-1,-1,2]]
n = len(B)
E = gram_schmidt(B, n)
print(E)
print(np.dot(E[0],E[1]))
