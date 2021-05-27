%Ejercicio de los carros resuelto con linealizacion (minimos cuadrados)
year = [0, 5, 10, 15, 20, 25, 30]';
cars = [53.05, 73.04, 98.31, 139.78, 193.48, 260.20, 320.39]';

A = [ones(7,1), year];
A_ = A'*A; 
B_ = A'*log(cars);
sol = A_\B_;
c1 = exp(sol(1));
c2 = sol(2);

w = c1 * exp(c2*year);
plot(year,cars,'o',year,w)

