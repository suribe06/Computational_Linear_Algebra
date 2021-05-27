%%%%Ejecutable taller 2%%%%
%Andres Quintero y Santiago Uribe
warning off;

%Punto 1
X = [0, 0, 6370, 0]';
A = [15600, 18760, 17610, 19170];
B = [7540, 2750, 14630, 610];
C = [20140, 18610, 13480, 18390];
t = [0.07074, 0.07220, 0.07690, 0.07242];
n_satelites = length(A);
orden = 10^-10;
nmax = 20;
ans1 = Newton_punto1(X,A,B,C,t,n_satelites, orden, nmax);

%Punto 2
ans2 = punto2(A, B, C, t);

%Punto 3
ans3 = punto3(A, B, C, t);

%Punto 4
X = [0,0,6370,0.0001]';
[emf_max_4, max_error_pos] = punto4(X, n_satelites, orden, nmax);
max_error_pos_4 = max_error_pos*1000; %traspaso a metros

%Punto 5
X = [0,0,6370,0.0001]';
[emf_max_5, max_error_pos] = punto5(X, n_satelites, 10^-7, nmax);
max_error_pos_5 = max_error_pos*1000; %traspaso a metros

%Punto 6
X = [0,0,6370,0.0001]';
n_sat = [4, 6, 8, 10, 12, 15]; %probar con diferentes cantidades de satelites
emf_max_6 = [];
max_error_pos_6 = [];
for i=1:length(n_sat)
    ns = n_sat(i);
    [emf_max_i, max_error_pos_i] = punto4(X, ns, 10^-7, nmax);
    emf_max_6(i) = emf_max_i;
    max_error_pos_6(i) = max_error_pos_i*1000;
end