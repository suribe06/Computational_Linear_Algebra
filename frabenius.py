
A = [[1,2,3],[2,0,1],[3,-1,0]]

sum = 0
for i in range(len(A)):
    for j in range(len(A[0])):
        sum += pow(A[i][j], 2)

F = pow(sum,0.5)

print(F)
