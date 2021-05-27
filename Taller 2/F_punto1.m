function F = F_punto1(X,n_satelites,A,B,C,t)
    %{
    Entrada: 
        A, B, y C coordenadas de satelites
        X coordenadas actales (x,y,z,d)
        t vector de tiempo
        n_satelites numero de satelites
    Salida:
        Funcion F
    %}
    c = 299792.458; %velocidad de la luz
    F = [];
    for i=1:n_satelites
        F(i, :) = [(X(1)-A(i))^2 + (X(2)-B(i))^2 + (X(3)-C(i))^2 - (c*(t(i)-X(4)))^2];
    end
end