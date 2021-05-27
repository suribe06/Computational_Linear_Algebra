data = readmatrix('punto_2.txt');
n = length(data);
t = data(:, 1);
Y = data(:, 2);

nmax = 100;
orden = 10^-3;
V = [9.5,22,0.2]';

k = 1;
    while k < nmax
        DF = Df(V, t);
        F = F_punto2(V,Y,t);
        y = (DF'*DF)\(-DF'*F);
        x = y + V;
        if norm(y) < orden
            break
        end
        V = x;
        k = k+1;
    end
     
  t_ = 0:0.1:6;
  w = V(1) + V(2)*exp(-(t_+V(3)));
  plot(t, Y, 'o', t_, w);
  
  %Calculo de T(5)
  T5 = V(1) + V(2)*exp(-(5+V(3)));