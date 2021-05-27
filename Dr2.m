function Ja = Dr2(c1, c2, t)
    %{
    Esta funcion calcula el Jacobiano para el problema de los carros por
    metodo de minimos cuadrados
    Entrada:
        x0: vector que representa los años
        y0: vector que representa la cantidad de carros
    %}
    Ja = [];
    for i=1:length(t)
        Ja(i, :) = [-exp(c2*t(i)), -c1*t(i)*exp(c2*t(i))];
    end  
end