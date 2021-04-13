x = [1, 1.2, 1.4, 1.9];
y = [1.3, 1.5, 1.8, 2.1];

A = [x', ones(length(x), 1)];
A_ = A'*A;
B_ = A'*y';

sol = A_\B_;
proy = A*sol;
plot(x,proy,x,y,'o');
