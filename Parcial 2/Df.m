function Ja = Df(V, t)
    %{
    Esta funcion calcula el Jacobiano
    Entrada:
        V: vector que de variables (a1, a2, a3)
        t: vector que representa el tiempo
    %}
    Ja = [];
    for i=1:length(t)
        Ja(i, :) = [1, exp(-(t(i)+V(3))), -V(2)*exp(-(t(i)+V(3)))];
    end  
end