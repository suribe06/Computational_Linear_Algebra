function Ja = Df_punto1(X,n_satelites,A,B,C,t)
    %{
    Entrada: 
        A, B, y C coordenadas de satelites
        X coordenadas actuales (x,y,z,d)
        t vector de tiempo
        n_satelites numero de satelites
    Salida:
        Matriz de Jacobiano
    %}
    c = 299792.458; %velocidad de la luz
    Ja = [];
    for i=1:n_satelites
        Ja(i, :) = [2*(X(1)-A(i)), 2*(X(2)-B(i)), 2*(X(3)-C(i)), 2*(c^2*(t(i)-X(4)))];
    end
end