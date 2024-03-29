%f = @(x) x^3 + x - 1;
%df = @(x) 3*x^2 + 1;
%[x, ex] = Newton(f, df, -0.7, 10^-2, 6);
%F = @(x) [x(2)-x(1)^3; x(1)^2+x(2)^2-1];

%Ejemplo de minimos cuadrados no lineales (3 circulos y minimizar la distancia entre ellos)
F = @(x) [sqrt((x(1)+1)^2 + (x(2))^2) - 1; sqrt((x(1)-1)^2 + (x(2)-0.5)^2) - 0.5; sqrt((x(1)-1)^2 + (x(2)+0.5)^2) - 0.5];
x = Newton_n_variables2(F, [0.9; 0.4], 10^-10, 1000);