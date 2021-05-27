function Ja = Dr(x, y, x0, y0)
    %{
    Esta funcion calcula el Jacobiano para el problema de los 4 circulos
    radio variable
    Entrada:
        x0: eje x del vector de coordnadas de los centros de los circulos
        y0: eje y del vector de coordnadas de los centros de los circulos
    %}
    Ja = [];
    for i=1:length(x0)
        d = sqrt((x-x0(i))^2 + (y-y0(i))^2);
        Ja(i, :) = [(x-x0(i))/d, (y-y0(i))/d, -1];
    end  
end