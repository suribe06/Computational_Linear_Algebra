%a = [1 2 3; 3 4 5; 5 3 6]
%[l, u, p] = lu(a)
%b = [1 3 2]'
%c = p'*b
%y = l\c
%x = u\y
%a*x

%%%%%%%%
clear all
load('A2.mat');
load('b2.mat');
cond(A)
[l,u,p]=lu(A);
c = p'*b;
y = l\c;
x = u\y;
res = norm(A*x-b);
res2 = norm(A*x-b, 1);
sprintf("residuo con LU %e", res)
