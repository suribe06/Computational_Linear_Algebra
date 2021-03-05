import numpy as np

def gram_schmidtQR(B):
    B = np.transpose(B)
    n, m = len(B[0]), len(B)
    Q, R = np.zeros((m,n)), np.zeros((n,n))
    for i in range(n):
        y = B[:,i]
        for j in range(i):          
            R[j][i] = np.dot(B[:,i], Q[:,j])
            y = y - (R[j][i]*Q[:,j])
        R[i][i] =  np.linalg.norm(y)
        Q[:,i] = y / R[i][i]
    return Q, R

B = [[1,0,0,-1], [1,2,0,-1], [3,1,1,-1]]
Q, R = gram_schmidtQR(B)
print(Q)
print(R)
print(np.matmul(Q,R))


