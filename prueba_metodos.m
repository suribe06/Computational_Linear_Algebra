A = [2 3 ; 1 4];
%{
    Autovalores: lambda1=5 , lambda2=1
    Autovectores: [1 1]' , [-3 1]'
%}

B = [8 -8 -4; 12 -15 -7; -18 26 12];
%{
    Autovalores: lambda1=4 , lambda2=2, lambda3=-1
    Autovectores: [-1 -1 1]' , [2 1 1]' , [0 -1 2]'
%}

C = [10 -12 -6; 5 -5 -4; -1 0 3];
%{
    Autovalores: lambda1=4 , lambda2=3, lambda3=1
    Autovectores: [-1 -1 1]' , [0 -1 2]' , [2 1 1]'
%}

%Matriz B
%metodo potencias, para hallar el mayor autovalor
[xB1, lambdaB] = metodo_potencias(B, 100);
%metodo potencias inversas, para hallar el menor autovalor
s = 0;
[xB2, lambdaB2] = metodo_potencias_inversa(B, s, 100);
%metodo iteracion del cociente de rayleigh
[xB3, lambdaB3] = iteracion_rayleigh(B, 5);
%encontrar valor de la mitad de B usando desplazamiento
s = 1.8;
[xB4, lambdaB4] = metodo_potencias_inversa(B, s, 100);

%Matriz C
%metodo potencias, para hallar el mayor autovalor
[xC, lambdaC] = metodo_potencias(C, 100);
%metodo potencias inversas, para hallar el menor autovalor
s = 0;
[xC2, lambdaC2] = metodo_potencias_inversa(C, s, 100);
%metodo iteracion del cociente de rayleigh
[xC3, lambdaC3] = iteracion_rayleigh(C, 5);
%encontrar valor de la mitad de B usando desplazamiento
s = 3.1;
[xC4, lambdaC4] = metodo_potencias_inversa(C, s, 100);
