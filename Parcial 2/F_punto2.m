function F = F_punto2(V,y,t)
    %{
    Esta funcion representa mi funcion F
    Entrada:
        V: vector que de variables (a1, a2, a3)
        t: vector que representa el tiempo
        y: vector que representa la temperatura
    %}
    F = [];
    for i=1:length(t)
        F(i, :) = [V(1) + V(2)*exp(-(t(i)+V(3))) - y(i)];
    end
end