A = [1 2 3; 2 3 7; 2 0 3];
[U, S, V] = svd(A);

n2a = norm(A, 2);

%literal c
e1 = [1,0,0]';
x = V*e1;

n2c = norm(A*x, 2);