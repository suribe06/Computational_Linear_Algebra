data = readmatrix('punto_1.txt');
n = length(data);
t = data(:, 1);
Y = data(:, 2);

A = [ones(n,1), t];
A_ = A'*A; 
B_ = A'*Y;
sol = A_\B_;

R = Y - A*sol;
MSE = norm(R, 2)/sqrt(n);

a1 = sol(1);
a2 = sol(2);

%Calculo de Y(5)
y5 = a1 + a2*5;